function search_steady()
    % ========= НАСТРОЙКИ =========
    n_draws = 500;                       % сколько наборов пробовать
    out_csv = 'steady_successes.csv';    % куда писать успешные наборы
    mod_name = 'tmp_search_model';       % имя временной .mod модели

    rand("seed", 42);
    randn("seed", 42);

    % если файл уже есть — удалим
    if exist(out_csv, 'file')
        delete(out_csv);
    end

    % заголовок CSV
    fid = fopen(out_csv, 'w');
    fprintf(fid, 'alpha,betta,delta,theta,psi,phi,nu,mu,rho,sig_tfp,Y,K,L,C,I,W,R,P,MC,tfp\n');
    fclose(fid);

    success_count = 0;

    for it = 1:n_draws
        % ========= СЛУЧАЙНЫЙ НАБОР ПАРАМЕТРОВ =========
        p.alpha   = draw_uniform(0.25, 0.45);
        p.betta   = draw_uniform(0.97, 0.995);
        p.delta   = draw_uniform(0.01, 0.05);
        p.theta   = draw_uniform(1.0, 3.0);
        p.psi     = draw_uniform(0.1, 1.5);
        p.phi     = draw_uniform(0.1, 50.0);
        p.nu      = draw_uniform(1.05, 8.0);   % > 1, иначе MC может стать отрицательным
        p.mu      = draw_uniform(0.5, 10.0);
        p.rho     = draw_uniform(0.7, 0.99);
        p.sig_tfp = draw_uniform(0.005, 0.10);

        % создаём временный .mod
        write_mod_file(mod_name, p);

        % подчистим глобальные dynare-переменные от прошлого запуска
        clear global M_ oo_ options_ estim_params_ bayestopt_ dataset_ dataset_info_

        try
            % запускаем Dynare
            eval(sprintf('dynare %s noclearall nograph', mod_name));

            ok = false;

            % проверка, что steady state найден и конечный
            global oo_
            if exist('oo_', 'var') || isglobal('oo_')
                if isfield(oo_, 'steady_state')
                    ss = oo_.steady_state;
                    if ~isempty(ss) && all(isfinite(ss))
                        ok = true;
                    end
                end
            end

            if ok
                success_count = success_count + 1;

                ss = oo_.steady_state(:)';
                fid = fopen(out_csv, 'a');
                fprintf(fid, ...
                    ['%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,' ...
                     '%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g,%.10g\n'], ...
                    p.alpha, p.betta, p.delta, p.theta, p.psi, p.phi, p.nu, p.mu, p.rho, p.sig_tfp, ...
                    ss(1), ss(2), ss(3), ss(4), ss(5), ss(6), ss(7), ss(8), ss(9), ss(10));
                fclose(fid);

                printf('OK  #%d at iter %d\n', success_count, it);
            else
                printf('FAIL iter %d: no finite steady state\n', it);
            end

        catch err
            printf('FAIL iter %d: %s\n', it, err.message);
        end

        % подчистка временных файлов Dynare
        cleanup_dynare_files(mod_name);
    end

    printf('\nDone. Successful parameter sets: %d\n', success_count);
    printf('Saved to: %s\n', out_csv);
end


function x = draw_uniform(a, b)
    x = a + (b - a) * rand();
end


function write_mod_file(mod_name, p)
    fname = [mod_name '.mod'];
    fid = fopen(fname, 'w');

    fprintf(fid, 'var Y K L C I W R P MC tfp;\n');
    fprintf(fid, 'varexo tfp_shock;\n');
    fprintf(fid, 'predetermined_variables K;\n\n');

    fprintf(fid, 'parameters alpha betta delta theta psi phi nu mu rho sig_tfp;\n');
    fprintf(fid, 'alpha   = %.16g;\n', p.alpha);
    fprintf(fid, 'betta   = %.16g;\n', p.betta);
    fprintf(fid, 'delta   = %.16g;\n', p.delta);
    fprintf(fid, 'theta   = %.16g;\n', p.theta);
    fprintf(fid, 'psi     = %.16g;\n', p.psi);
    fprintf(fid, 'phi     = %.16g;\n', p.phi);
    fprintf(fid, 'nu      = %.16g;\n', p.nu);
    fprintf(fid, 'mu      = %.16g;\n', p.mu);
    fprintf(fid, 'rho     = %.16g;\n', p.rho);
    fprintf(fid, 'sig_tfp = %.16g;\n\n', p.sig_tfp);

    fprintf(fid, 'model;\n');
    fprintf(fid, '    (C(+1)/C)^theta - betta*(R(+1)+1-delta)*P(+1)/P = 0;\n');
    fprintf(fid, '    K(+1) - (1-delta)*K - I = 0;\n');
    fprintf(fid, '    phi*L^psi*C^theta - W/P = 0;\n');

    % ВАЖНО: тут поправленное бюджетное ограничение с прибылью фирмы
    fprintf(fid, '    W*L + R*K + P*Y*(1-MC) - P*C - I = 0;\n');

    fprintf(fid, '    Y - tfp*K^alpha*L^(1-alpha) = 0;\n');
    fprintf(fid, '    K/L - (W/R)*(alpha/(1-alpha)) = 0;\n');
    fprintf(fid, '    MC - (W/(1-alpha))^(1-alpha)*(R/alpha)^(alpha) = 0;\n');
    fprintf(fid, '    (1-nu) + nu*MC/P - mu*(P/P(-1)-1)*(P/P(-1)) + betta*mu*(P(+1)/P-1)*((P(+1)/P)^2)*(Y(+1)/Y) = 0;\n');
    fprintf(fid, '    P*Y - P*C - I = 0;\n');
    fprintf(fid, '    log(tfp) = rho*log(tfp(-1)) + tfp_shock;\n');
    fprintf(fid, 'end;\n\n');

    % стартовые значения, чтобы steady solver не стартовал "с потолка"
    fprintf(fid, 'initval;\n');
    fprintf(fid, '    tfp = 1;\n');
    fprintf(fid, '    P   = 1;\n');
    fprintf(fid, '    MC  = max((nu-1)/nu, 0.05);\n');
    fprintf(fid, '    R   = max(1/betta - 1 + delta, 0.001);\n');
    fprintf(fid, '    L   = 0.30;\n');
    fprintf(fid, '    K   = 5.00;\n');
    fprintf(fid, '    I   = delta*K;\n');
    fprintf(fid, '    Y   = tfp*K^alpha*L^(1-alpha);\n');
    fprintf(fid, '    C   = max(Y - I, 0.10);\n');
    fprintf(fid, '    W   = (1-alpha)*MC*(K/L)^alpha;\n');
    fprintf(fid, '    tfp_shock = 0;\n');
    fprintf(fid, 'end;\n\n');

    fprintf(fid, 'steady(maxit=200);\n\n');

    fprintf(fid, 'shocks;\n');
    fprintf(fid, '    var tfp_shock = sig_tfp^2;\n');
    fprintf(fid, 'end;\n\n');

    fprintf(fid, 'stoch_simul(order=1, irf=0, nograph, nomoments, nocorr, nodecomposition);\n');

    fclose(fid);
end


function cleanup_dynare_files(mod_name)
    exts = {'.mod', '.m', '.mat', '.log', '.jnl', '_results.mat', '_set_auxiliary_variables.m', '_dynamic.m', '_static.m'};
    for i = 1:numel(exts)
        f = [mod_name exts{i}];
        if exist(f, 'file')
            delete(f);
        end
    end
end

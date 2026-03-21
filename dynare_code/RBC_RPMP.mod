var Y K L C I W Wreal R Rreal Rb Rbreal MC MCreal Pr Prreal P pi tfp mon;
varexo tfp_shock; // технологический шок
varexo mon_shock; // денежно-кредитный шок
predetermined_variables K;
parameters alpha betta delta theta psi phi nu mu rho_tfp rho_mon sig_tfp sig_mon gamma tau piss Rss;
    alpha   = 0.35 ;
    betta   = 0.98 ;
    delta   = 0.025;
    theta   = 1.25  ;
    psi     = 0.5  ;
    phi     = 16.0 ;
    nu      = 6.0  ;
    mu      = 30.0  ;
    rho_tfp = 0.2  ;
    rho_mon = 0.0 ;
    sig_tfp = 0.001 ;

    gamma   = 0.8 ;
    tau     = 1.5  ;
    piss    = 1.0;
    Rss     = 1/betta;
    sig_mon = 0.0025 ;

model;
    (C(+1)/C)^theta - betta*(R(+1)/P(+1)+1-delta) = 0;
    (C(+1)/C)^theta - betta*(Rb/pi(+1))=0;
    K(+1) - (1-delta)*K - I = 0;
    phi*(L^psi)*(C^theta) - W/P = 0;
    Y - tfp*K^alpha*L^(1-alpha) = 0;
    K/L - (W/R)*(alpha/(1-alpha)) = 0;
    MC - (1/tfp)*(W/(1-alpha))^(1-alpha)*(R/alpha)^(alpha)=0;
    (1-nu)+nu*MC/P - mu*(P/P(-1) - 1)*(P/P(-1)) + betta*mu*(P(+1)/P -1)*(P(+1)/P)^2*(Y(+1)/Y) = 0;
    Pr = (P-MC)*Y - (mu/2)*(P/P(-1)-1)^2*P*Y ;
    Y  - C - I - (mu/2)*(P/P(-1)-1)^2*Y = 0;
    pi = P/P(-1);
    log(tfp) = rho_tfp*log(tfp(-1))-tfp_shock;
    (Rb/Rss) = mon*((Rb(-1)/Rss)^gamma)*(pi(+1)/piss)^(tau*(1-gamma));
    log(mon) = rho_mon*log(mon(-1)) - mon_shock;
    Wreal = W/P;
    Rreal = R/P;
    Rbreal= Rb/P;
    Prreal= Pr/P;
    MCreal= MC/P;
    //Pr+ W*L+R*K-P*C-P*I = 0;
end;

steady_state_model;
    mon=1;
    tfp=1;
    MC = 1;
    pi = 1;
    P  = MC*nu/(nu-1);
    Rb = 1/betta;
    R  = P*(1/betta + delta - 1);
    W  = (MC*((1-alpha)^(1-alpha)*alpha^alpha)/(R^alpha))^(1/(1-alpha));
    K2L= (W/R)*alpha/(1-alpha);
    C2L= K2L^alpha-delta*K2L;
    L = ((W/P/phi)/(C2L^theta))^(1/(psi+theta));
    K = K2L*L;
    C = C2L*L;
    Y  = K^alpha*L^(1-alpha);
    I  = delta*K;
    Pr=(P - MC)*Y;
    Wreal = W/P; Rreal = R/P; Rbreal= Rb/P;
    Prreal= Pr/P;
    MCreal= MC/P;
end;

steady;

check;
shocks;
  var tfp_shock=sig_tfp^2;
  var mon_shock=sig_mon^2;
end;

stoch_simul(order=1, irf=40, nograph); // ...,nograph) отключает стандартные графики dynare

// строим свои графики: в t=0 чёрная линия совпадает с красной(SS),
//  начиная с t=1 видно мгновенную реакцию на шок.
if ~exist('plots_absolute', 'dir')
    mkdir('plots_absolute');
end

vars = {'Y','K','L','C','I','W','Wreal','R','Rreal','Rb','Rbreal','MC','MCreal','Pr','Prreal','P','pi','tfp','mon'};
shock_list = {'tfp_shock','mon_shock'};
T = options_.irf;
ss = oo_.steady_state;

for s = 1:length(shock_list)
    shock_name = shock_list{s};

    % -------- Figure 1: первые 9 переменных --------
    f1 = figure('visible', 'off');
    set(f1, 'Position', [40 40 2400 1500]);

    for i = 1:9
        subplot(3,3,i);

        varname = vars{i};
        idx = strmatch(varname, M_.endo_names, 'exact');
        irf_field = [varname '_' shock_name];

        if ~isempty(idx) && isfield(oo_.irfs, irf_field)
            irf = oo_.irfs.(irf_field);
            level = ss(idx) + irf(:);
            level_plot = [ss(idx); level]; //  добавляет нулевой период.

            plot(0:T, level_plot, 'k', 'LineWidth', 2); // делает ось времени от 0 до T.
            hold on;
            yline(ss(idx), 'r', 'LineWidth', 1.5);
            grid on;
            title(varname, 'FontSize', 14);
            set(gca, 'FontSize', 12, 'LineWidth', 1.1);
            xlim([0 T]);
            hold off;
        end
    end

    print(f1, fullfile('plots_absolute', ['absolute_figure_1_' shock_name '.png']), '-dpng', '-r300');
    close(f1);

    % -------- Figure 2: остальные 10 переменных --------
    f2 = figure('visible', 'off');
    set(f2, 'Position', [40 40 2400 1500]);

    for i = 10:18
        subplot(3,3,i-9);

        varname = vars{i};
        idx = strmatch(varname, M_.endo_names, 'exact');
        irf_field = [varname '_' shock_name];

        if ~isempty(idx) && isfield(oo_.irfs, irf_field)
            irf = oo_.irfs.(irf_field);
            level = ss(idx) + irf(:);
            level_plot = [ss(idx); level]; //  добавляет нулевой период.

            plot(0:T, level_plot, 'k', 'LineWidth', 2); // делает ось времени от 0 до T.
            hold on;
            yline(ss(idx), 'r', 'LineWidth', 1.5);
            grid on;
            title(varname, 'FontSize', 14);
            set(gca, 'FontSize', 12, 'LineWidth', 1.1);
            xlim([0 T]);
            hold off;
        end
    end

    print(f2, fullfile('plots_absolute', ['absolute_figure_2_' shock_name '.png']), '-dpng', '-r300');
    close(f2);

    % -------- Figure 3: mon отдельно --------
    f3 = figure('visible', 'off');
    set(f3, 'Position', [80 80 1800 1000]);

    varname = 'mon';
    idx = strmatch(varname, M_.endo_names, 'exact');
    irf_field = [varname '_' shock_name];

    if ~isempty(idx) && isfield(oo_.irfs, irf_field)
        irf = oo_.irfs.(irf_field);
        level = ss(idx) + irf(:);
        level_plot = [ss(idx); level]; //  добавляет нулевой период.

        plot(0:T, level_plot, 'k', 'LineWidth', 2); // делает ось времени от 0 до T.
        hold on;
        yline(ss(idx), 'r', 'LineWidth', 1.5);
        grid on;
        title('mon', 'FontSize', 16);
        set(gca, 'FontSize', 13, 'LineWidth', 1.1);
        xlim([0 T]);
        hold off;

        print(f3, fullfile('plots_absolute', ['absolute_mon_' shock_name '.png']), '-dpng', '-r300');
    end

    close(f3);
end

if ~exist('plots_joint', 'dir')
    mkdir('plots_joint');
end

T = 40;
ss = oo_.dr.ys;                 % steady state in declaration order
Ex = zeros(T, M_.exo_nbr);      % T periods x number of exogenous shocks

% оба шока одновременно в первом периоде
Ex(1, strmatch('tfp_shock', M_.exo_names, 'exact')) = sig_tfp;
Ex(1, strmatch('mon_shock', M_.exo_names, 'exact')) = sig_mon;

% "честная" симуляция по заданному пути инноваций
Yjoint = simult_(M_, options_, ss, oo_.dr, Ex, 1);

vars = {'Y','K','L','C','I','W','Wreal','R','Rreal','Rb','Rbreal','MC','MCreal','Pr','Prreal','P','pi','tfp','mon'};

% -------- Figure 1 --------
f1 = figure('visible', 'off');
set(f1, 'Position', [40 40 2400 1500]);

for i = 1:9
    subplot(3,3,i);

    varname = vars{i};
    idx = strmatch(varname, M_.endo_names, 'exact');

    if ~isempty(idx)
        level_plot = [ss(idx), Yjoint(idx,1:T)];

        plot(0:T, level_plot, 'k', 'LineWidth', 2);
        hold on;
        yline(ss(idx), 'r', 'LineWidth', 1.5);
        grid on;
        title(varname, 'FontSize', 14);
        set(gca, 'FontSize', 12, 'LineWidth', 1.1);
        xlim([0 T]);
        hold off;
    end
end

print(f1, fullfile('plots_joint', 'joint_figure_1.png'), '-dpng', '-r300');
close(f1);

% -------- Figure 2 --------
f2 = figure('visible', 'off');
set(f2, 'Position', [40 40 2400 1500]);

for i = 10:18
    subplot(3,3,i-9);

    varname = vars{i};
    idx = strmatch(varname, M_.endo_names, 'exact');

    if ~isempty(idx)
        level_plot = [ss(idx), Yjoint(idx,1:T)];

        plot(0:T, level_plot, 'k', 'LineWidth', 2);
        hold on;
        yline(ss(idx), 'r', 'LineWidth', 1.5);
        grid on;
        title(varname, 'FontSize', 14);
        set(gca, 'FontSize', 12, 'LineWidth', 1.1);
        xlim([0 T]);
        hold off;
    end
end

print(f2, fullfile('plots_joint', 'joint_figure_2.png'), '-dpng', '-r300');
close(f2);

% -------- mon отдельно --------
f3 = figure('visible', 'off');
set(f3, 'Position', [80 80 1800 1000]);

idx = strmatch('mon', M_.endo_names, 'exact');
level_plot = [ss(idx), Yjoint(idx,1:T)];

plot(0:T, level_plot, 'k', 'LineWidth', 2);
hold on;
yline(ss(idx), 'r', 'LineWidth', 1.5);
grid on;
title('mon / joint shocks', 'FontSize', 16);
set(gca, 'FontSize', 13, 'LineWidth', 1.1);
xlim([0 T]);
hold off;

print(f3, fullfile('plots_joint', 'joint_mon.png'), '-dpng', '-r300');
close(f3);

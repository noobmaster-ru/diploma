% Octave runner для RBC_RPMP:
% генерирует два набора IRF — order=1 (локальное линейное приближение)
% и order=2 с pruning (нелинейное приближение более высокого порядка) —
% сохраняет .mat и общие панели в ../dynare_images_rpmp/.
%
%     octave --no-gui --eval "run_and_save_rpmp"

addpath(getenv('DYNARE_PATH'));

src_mod = 'RBC_RPMP.mod';
raw = fileread(src_mod);

variables = {'Y','K','L','C','I','W','Wreal','R','Rreal','Rb','Rbreal', ...
             'MC','MCreal','Pr','Prreal','P','pi','tfp','mon'};
shocks    = {'tfp_shock','mon_shock'};
shock_lbl = struct('tfp_shock','shock TFP', 'mon_shock','shock MON');
n_vars = numel(variables);
n_shocks = numel(shocks);

out_dir = fullfile('..', 'dynare_images_rpmp');
if ~exist(out_dir, 'dir'); mkdir(out_dir); end

% Конфигурация двух прогонов: имя, опции stoch_simul, имя .mat.
% nomoments/nocorr/nograph — обходят ошибку pruned_state_space на unit-root
% переменной log(P), которая возникает только в расчёте теоретических моментов.
runs = {
    struct('name', 'lin',  'opts', 'order=1, irf=40, nograph, nomoments, nocorr',           'tag','order=1'),
    struct('name', 'glob', 'opts', 'order=2, pruning, irf=40, nograph, nomoments, nocorr',  'tag','order=2+pruning')
};

% Куда сложить IRF после каждого прогона.
all_irfs = struct();
all_ss   = struct();

for r = 1:numel(runs)
    cfg = runs{r};
    tmp_name = ['RBC_RPMP_' cfg.name];
    tmp_mod  = [tmp_name '.mod'];
    out_raw = strrep(raw, 'stoch_simul(irf=40);', ...
                          ['stoch_simul(' cfg.opts ');']);
    fid = fopen(tmp_mod, 'w'); fprintf(fid, '%s', out_raw); fclose(fid);

    fprintf('\n=== Run #%d: %s (%s) ===\n', r, cfg.name, cfg.tag);
    dynare(tmp_name, 'noclearall', 'nolog');

    ss = struct();
    for i = 1:n_vars
        idx = strmatch(variables{i}, M_.endo_names, 'exact');
        ss.(variables{i}) = oo_.steady_state(idx);
    end

    irfs = struct();
    for s = 1:n_shocks
        for i = 1:n_vars
            fld_in = [variables{i} '_' shocks{s}];
            if isfield(oo_.irfs, fld_in)
                irfs.([variables{i} '_irf_' shocks{s}]) = oo_.irfs.(fld_in);
            end
        end
    end
    save(fullfile(out_dir, ['dynare_irf_rpmp_' cfg.name '.mat']), '-struct', 'irfs');

    all_irfs.(cfg.name) = irfs;
    all_ss.(cfg.name) = ss;
    all_irfs.(cfg.name) = setfield(all_irfs.(cfg.name), '__tag__', cfg.tag);

    % Чистим временный .mod и его кэш.
    delete(tmp_mod);
    if exist(tmp_name, 'dir'); rmdir(tmp_name, 's'); end
    log_file = [tmp_name '.log']; if exist(log_file, 'file'); delete(log_file); end
    matm_file = [tmp_name '.m']; if exist(matm_file, 'file'); delete(matm_file); end
    if exist(['+' tmp_name], 'dir'); rmdir(['+' tmp_name], 's'); end
end

% --- Большая 5x4 панель: для каждого (шок × прогон) рисуем все 19 переменных.
ss_lin = all_ss.lin;  % SS одинаков
fn_lin = fieldnames(all_irfs.lin);
fn_lin(strcmp(fn_lin, '__tag__')) = [];
T = numel(all_irfs.lin.(fn_lin{1}));
t = 0:(T-1);

n_rows = 5; n_cols = 4;
for s = 1:n_shocks
    f = figure('visible', 'off', 'position', [0 0 1400 1500]);
    for i = 1:n_vars
        subplot(n_rows, n_cols, i);
        fld = [variables{i} '_irf_' shocks{s}];
        has_lin = isfield(all_irfs.lin, fld);
        has_glb = isfield(all_irfs.glob, fld);
        if isfinite(ss_lin.(variables{i})) && abs(ss_lin.(variables{i})) > 1e-12
            scale = 100.0 / ss_lin.(variables{i});
            ylbl = '% от SS';
        else
            scale = 1.0;
            ylbl = 'level dev';
        end
        hold on;
        if has_lin
            plot(t, scale * all_irfs.lin.(fld), 'r--', 'linewidth', 1.6, ...
                 'displayname', 'order=1');
        end
        if has_glb
            plot(t, scale * all_irfs.glob.(fld), 'b-', 'linewidth', 1.6, ...
                 'displayname', 'order=2 + pruning');
        end
        plot(t, zeros(size(t)), 'k:', 'linewidth', 0.6);
        grid on;
        title(variables{i}, 'fontsize', 11);
        xlabel('периоды'); ylabel(ylbl);
        if i == 1
            legend('location', 'northeast');
        end
    end
    ax = axes('position', [0 0.96 1 0.035], 'visible', 'off');
    text(0.5, 0.5, sprintf('RBC-RPMP: order=1 vs order=2+pruning, %s', ...
         shock_lbl.(shocks{s})), 'horizontalalignment', 'center', ...
         'fontsize', 14, 'fontweight', 'bold');
    fname = fullfile(out_dir, sprintf('panel_compare_%s.png', shocks{s}));
    print(f, fname, '-dpng', '-r130');
    close(f);
end

fprintf('\nDone. .mat files: dynare_irf_rpmp_lin.mat, dynare_irf_rpmp_glob.mat\n');
fprintf('Panels: panel_compare_tfp_shock.png, panel_compare_mon_shock.png\n');

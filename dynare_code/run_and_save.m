% Octave runner: solves RBC.mod via Dynare and saves IRF plots.
% Usage from dynare_code/:
%     octave --no-gui --eval "run_and_save"

addpath(getenv('DYNARE_PATH'));

dynare RBC noclearall nolog

out_dir = fullfile('..', 'dynare_images');
if ~exist(out_dir, 'dir')
    mkdir(out_dir);
end

irf = oo_.irfs;
T = numel(irf.Y_tfp_shock);
t = 0:(T-1);

names = {'Y', 'K', 'L', 'C', 'I', 'W', 'R', 'Pr', 'MC', 'tfp'};
titles = {'Output Y', 'Capital K', 'Labor L', 'Consumption C', ...
          'Investment I', 'Wage W', 'Rental rate R', 'Profit Pr', ...
          'Marginal cost MC', 'TFP'};

ss = struct();
for k = 1:numel(names)
    nm = names{k};
    ss.(nm) = oo_.steady_state(strmatch(nm, M_.endo_names, 'exact'));
end

% Per-variable PNGs
for k = 1:numel(names)
    nm = names{k};
    raw = irf.([nm '_tfp_shock']);
    % Защита от деления на ноль для переменных, чей SS близок к 0.
    if abs(ss.(nm)) < 1e-10
        pct = raw;
        ylab = 'level deviation from SS';
    else
        pct = 100 * raw / ss.(nm);
        ylab = '% deviation from SS';
    end

    f = figure('visible', 'off');
    plot(t, pct, 'r-', 'linewidth', 2); hold on;
    plot(t, zeros(size(t)), 'k:', 'linewidth', 1);
    grid on;
    xlabel('Periods');
    ylabel(ylab);
    title([titles{k} ' --- Dynare local IRF (1 std TFP shock)']);
    fname = fullfile(out_dir, ['dynare_irf_' nm '.png']);
    print(f, fname, '-dpng', '-r150');
    close(f);
end

% Combined panel: 5 rows x 2 cols
f = figure('visible', 'off', 'position', [0 0 1100 1500]);
for k = 1:numel(names)
    subplot(5, 2, k);
    nm = names{k};
    raw = irf.([nm '_tfp_shock']);
    if abs(ss.(nm)) < 1e-10
        pct = raw;
        ylab = 'level dev.';
    else
        pct = 100 * raw / ss.(nm);
        ylab = '% dev.';
    end
    plot(t, pct, 'r-', 'linewidth', 1.6); hold on;
    plot(t, zeros(size(t)), 'k:', 'linewidth', 1);
    grid on;
    xlabel('Periods');
    ylabel(ylab);
    title(titles{k});
end
print(f, fullfile(out_dir, 'dynare_irf_panel.png'), '-dpng', '-r150');
close(f);

% RBC.mod уже сохранил dynare_irf.mat в dynare_code/. Зеркалим в корень.
if exist('dynare_irf.mat', 'file')
    copyfile('dynare_irf.mat', fullfile('..', 'dynare_irf.mat'));
end

fprintf('Saved IRF plots to %s\n', out_dir);

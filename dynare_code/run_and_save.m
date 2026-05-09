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

ss.Y = oo_.steady_state(strmatch('Y', M_.endo_names, 'exact'));
ss.C = oo_.steady_state(strmatch('C', M_.endo_names, 'exact'));
ss.I = oo_.steady_state(strmatch('I', M_.endo_names, 'exact'));
ss.L = oo_.steady_state(strmatch('L', M_.endo_names, 'exact'));

series = {'Y', 'C', 'I', 'L'};
titles = {'Output Y', 'Consumption C', 'Investment I', 'Labor L'};

for k = 1:numel(series)
    name = series{k};
    raw = irf.([name '_tfp_shock']);
    pct = 100 * raw / ss.(name);

    f = figure('visible', 'off');
    plot(t, pct, 'r-', 'linewidth', 2); hold on;
    plot(t, zeros(size(t)), 'k:', 'linewidth', 1);
    grid on;
    xlabel('Periods');
    ylabel('% deviation from SS');
    title([titles{k} ' — Dynare local IRF (1 std TFP shock)']);
    fname = fullfile(out_dir, ['dynare_irf_' name '.png']);
    print(f, fname, '-dpng', '-r150');
    close(f);
end

f = figure('visible', 'off', 'position', [0 0 1200 800]);
for k = 1:numel(series)
    subplot(2, 2, k);
    name = series{k};
    raw = irf.([name '_tfp_shock']);
    pct = 100 * raw / ss.(name);
    plot(t, pct, 'r-', 'linewidth', 2); hold on;
    plot(t, zeros(size(t)), 'k:', 'linewidth', 1);
    grid on;
    xlabel('Periods');
    ylabel('% deviation');
    title(titles{k});
end
print(f, fullfile(out_dir, 'dynare_irf_panel.png'), '-dpng', '-r150');
close(f);

% RBC.mod already saved dynare_irf.mat into dynare_code/. Mirror to repo root
% so the notebook (which loads ../dynare_irf.mat) finds an up-to-date copy.
if exist('dynare_irf.mat', 'file')
    copyfile('dynare_irf.mat', fullfile('..', 'dynare_irf.mat'));
end

fprintf('Saved IRF plots to %s\n', out_dir);

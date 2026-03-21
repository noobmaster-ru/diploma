var Y K L C I W R P MC tfp;
varexo tfp_shock;
predetermined_variables K;

parameters alpha betta delta theta psi phi nu mu rho sig_tfp;

alpha    = 0.45;   // elasticity of production wrt capital
betta    = 0.96;   // discount factor
delta    = 0.025;  // depreciation rate
psi      = 0.35;   // inverse Frisch elasticity
phi      = 100.0;  // disutility of labor
nu       = 6.0;
mu       = 5.0;
theta    = 2.00;
rho      = 0.9;    // persistence
sig_tfp  = 0.10;   // std of shock

model;
    (C(+1)/C)^theta - betta*(R(+1)+1-delta)*P(+1)/P = 0;
    K(+1) - (1-delta)*K - I = 0;
    phi*L^psi*C^theta - W/P = 0;
    W*L + R*K + P*Y*(1-MC) - P*C - P*I = 0;
    Y - tfp*K^alpha*L^(1-alpha) = 0;
    K/L - (W/R)*(alpha/(1-alpha)) = 0;
    MC - (W/(1-alpha))^(1-alpha)*(R/alpha)^(alpha) = 0;
    (1-nu) + nu*MC/P - mu*(P/P(-1)-1)*(P/P(-1)) + betta*mu*(P(+1)/P-1)*((P(+1)/P)^2)*(Y(+1)/Y) = 0;
    Y - C - I = 0;
    log(tfp) = rho*log(tfp(-1)) + tfp_shock;
end;

initval;
    tfp = 1;
    P   = 1;
    MC  = (nu-1)/nu;
    R   = 1/betta - 1 + delta;
    L   = 0.1;
    K   = 1.0;
    I   = delta*K;
    Y   = tfp*K^alpha*L^(1-alpha);
    C   = Y - I;
    W   = phi*L^psi*C^theta*P;
    tfp_shock = 0;
end;

steady;
check;

shocks;
    var tfp_shock = sig_tfp^2;
end;

// ---------- стандартные IRF Dynare, но скрыто ----------
set(0, 'defaultfigurevisible', 'off');
stoch_simul(order=1, irf=40);
set(0, 'defaultfigurevisible', 'on');

// ---------- absolute-level графики ----------
if ~exist('plots_absolute', 'dir')
    mkdir('plots_absolute');
end

vars = {'Y','K','L','C','I','W','R','P','MC','tfp'};
shock_name = 'tfp_shock';
T = options_.irf;
ss = oo_.steady_state;

// -------- figure 1: первые 9 переменных --------
f1 = figure('visible', 'off');
set(f1, 'Position', [50 50 2200 1400]);

for i = 1:9
    subplot(3,3,i);

    varname = vars{i};
    idx = strmatch(varname, M_.endo_names, 'exact');
    irf_field = [varname '_' shock_name];

    if ~isempty(idx) && isfield(oo_.irfs, irf_field)
        irf = oo_.irfs.(irf_field);
        level = ss(idx) + irf(:);
        level_plot = [ss(idx); level];

        plot(0:T, level_plot, 'k', 'LineWidth', 2);
        hold on;
        yline(ss(idx), 'r', 'LineWidth', 1.5);
        grid on;
        title(varname, 'FontSize', 14);
        set(gca, 'FontSize', 12, 'LineWidth', 1.1);
        hold off;
    end
end

print(f1, fullfile('plots_absolute', 'absolute_figure_1.png'), '-dpng', '-r300');
close(f1);

// -------- figure 2: tfp отдельно --------
f2 = figure('visible', 'off');
set(f2, 'Position', [80 80 1800 1000]);

varname = 'tfp';
idx = strmatch(varname, M_.endo_names, 'exact');
irf_field = [varname '_' shock_name];

if ~isempty(idx) && isfield(oo_.irfs, irf_field)
    irf = oo_.irfs.(irf_field);
    level = ss(idx) + irf(:);
    level_plot = [ss(idx); level];

    plot(0:T, level_plot, 'k', 'LineWidth', 2);
    hold on;
    yline(ss(idx), 'r', 'LineWidth', 1.5);
    grid on;
    title('tfp', 'FontSize', 16);
    set(gca, 'FontSize', 13, 'LineWidth', 1.1);
    hold off;

    print(f2, fullfile('plots_absolute', 'absolute_figure_2.png'), '-dpng', '-r300');
end

close(f2);

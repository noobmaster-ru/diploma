%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'RBC_RPMP';
M_.dynare_version = '6.5';
oo_.dynare_version = '6.5';
options_.dynare_version = '6.5';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'tfp_shock'};
M_.exo_names_tex(1) = {'tfp\_shock'};
M_.exo_names_long(1) = {'tfp_shock'};
M_.exo_names(2) = {'mon_shock'};
M_.exo_names_tex(2) = {'mon\_shock'};
M_.exo_names_long(2) = {'mon_shock'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'Y'};
M_.endo_names_long(1) = {'Y'};
M_.endo_names(2) = {'K'};
M_.endo_names_tex(2) = {'K'};
M_.endo_names_long(2) = {'K'};
M_.endo_names(3) = {'L'};
M_.endo_names_tex(3) = {'L'};
M_.endo_names_long(3) = {'L'};
M_.endo_names(4) = {'C'};
M_.endo_names_tex(4) = {'C'};
M_.endo_names_long(4) = {'C'};
M_.endo_names(5) = {'I'};
M_.endo_names_tex(5) = {'I'};
M_.endo_names_long(5) = {'I'};
M_.endo_names(6) = {'W'};
M_.endo_names_tex(6) = {'W'};
M_.endo_names_long(6) = {'W'};
M_.endo_names(7) = {'Wreal'};
M_.endo_names_tex(7) = {'Wreal'};
M_.endo_names_long(7) = {'Wreal'};
M_.endo_names(8) = {'R'};
M_.endo_names_tex(8) = {'R'};
M_.endo_names_long(8) = {'R'};
M_.endo_names(9) = {'Rreal'};
M_.endo_names_tex(9) = {'Rreal'};
M_.endo_names_long(9) = {'Rreal'};
M_.endo_names(10) = {'Rb'};
M_.endo_names_tex(10) = {'Rb'};
M_.endo_names_long(10) = {'Rb'};
M_.endo_names(11) = {'Rbreal'};
M_.endo_names_tex(11) = {'Rbreal'};
M_.endo_names_long(11) = {'Rbreal'};
M_.endo_names(12) = {'MC'};
M_.endo_names_tex(12) = {'MC'};
M_.endo_names_long(12) = {'MC'};
M_.endo_names(13) = {'MCreal'};
M_.endo_names_tex(13) = {'MCreal'};
M_.endo_names_long(13) = {'MCreal'};
M_.endo_names(14) = {'Pr'};
M_.endo_names_tex(14) = {'Pr'};
M_.endo_names_long(14) = {'Pr'};
M_.endo_names(15) = {'Prreal'};
M_.endo_names_tex(15) = {'Prreal'};
M_.endo_names_long(15) = {'Prreal'};
M_.endo_names(16) = {'P'};
M_.endo_names_tex(16) = {'P'};
M_.endo_names_long(16) = {'P'};
M_.endo_names(17) = {'pi'};
M_.endo_names_tex(17) = {'pi'};
M_.endo_names_long(17) = {'pi'};
M_.endo_names(18) = {'tfp'};
M_.endo_names_tex(18) = {'tfp'};
M_.endo_names_long(18) = {'tfp'};
M_.endo_names(19) = {'mon'};
M_.endo_names_tex(19) = {'mon'};
M_.endo_names_long(19) = {'mon'};
M_.endo_partitions = struct();
M_.param_names = cell(16,1);
M_.param_names_tex = cell(16,1);
M_.param_names_long = cell(16,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'betta'};
M_.param_names_tex(2) = {'betta'};
M_.param_names_long(2) = {'betta'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'theta'};
M_.param_names_tex(4) = {'theta'};
M_.param_names_long(4) = {'theta'};
M_.param_names(5) = {'psi'};
M_.param_names_tex(5) = {'psi'};
M_.param_names_long(5) = {'psi'};
M_.param_names(6) = {'phi'};
M_.param_names_tex(6) = {'phi'};
M_.param_names_long(6) = {'phi'};
M_.param_names(7) = {'nu'};
M_.param_names_tex(7) = {'nu'};
M_.param_names_long(7) = {'nu'};
M_.param_names(8) = {'mu'};
M_.param_names_tex(8) = {'mu'};
M_.param_names_long(8) = {'mu'};
M_.param_names(9) = {'rho_tfp'};
M_.param_names_tex(9) = {'rho\_tfp'};
M_.param_names_long(9) = {'rho_tfp'};
M_.param_names(10) = {'rho_mon'};
M_.param_names_tex(10) = {'rho\_mon'};
M_.param_names_long(10) = {'rho_mon'};
M_.param_names(11) = {'sig_tfp'};
M_.param_names_tex(11) = {'sig\_tfp'};
M_.param_names_long(11) = {'sig_tfp'};
M_.param_names(12) = {'sig_mon'};
M_.param_names_tex(12) = {'sig\_mon'};
M_.param_names_long(12) = {'sig_mon'};
M_.param_names(13) = {'gamma'};
M_.param_names_tex(13) = {'gamma'};
M_.param_names_long(13) = {'gamma'};
M_.param_names(14) = {'tau'};
M_.param_names_tex(14) = {'tau'};
M_.param_names_long(14) = {'tau'};
M_.param_names(15) = {'piss'};
M_.param_names_tex(15) = {'piss'};
M_.param_names_long(15) = {'piss'};
M_.param_names(16) = {'Rss'};
M_.param_names_tex(16) = {'Rss'};
M_.param_names_long(16) = {'Rss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 19;
M_.param_nbr = 16;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.predetermined_variables = [ 2 ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 19;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 6 25;
 1 7 0;
 0 8 0;
 0 9 26;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 27;
 0 14 0;
 2 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 0 20 0;
 3 21 28;
 0 22 29;
 4 23 0;
 5 24 0;]';
M_.nstatic = 10;
M_.nfwrd   = 4;
M_.npred   = 4;
M_.nboth   = 1;
M_.nsfwrd   = 5;
M_.nspred   = 5;
M_.ndynamic   = 9;
M_.dynamic_tmp_nbr = [17; 6; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'Pr' ;
  10 , 'name' , '10' ;
  11 , 'name' , 'pi' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
  14 , 'name' , '14' ;
  15 , 'name' , 'Wreal' ;
  16 , 'name' , 'Rreal' ;
  17 , 'name' , 'Rbreal' ;
  18 , 'name' , 'Prreal' ;
  19 , 'name' , 'MCreal' ;
};
M_.mapping.Y.eqidx = [5 8 9 10 ];
M_.mapping.K.eqidx = [3 5 6 ];
M_.mapping.L.eqidx = [4 5 6 ];
M_.mapping.C.eqidx = [1 2 4 10 ];
M_.mapping.I.eqidx = [3 10 ];
M_.mapping.W.eqidx = [4 6 7 15 ];
M_.mapping.Wreal.eqidx = [15 ];
M_.mapping.R.eqidx = [1 6 7 16 ];
M_.mapping.Rreal.eqidx = [16 ];
M_.mapping.Rb.eqidx = [2 13 17 ];
M_.mapping.Rbreal.eqidx = [17 ];
M_.mapping.MC.eqidx = [7 8 9 19 ];
M_.mapping.MCreal.eqidx = [19 ];
M_.mapping.Pr.eqidx = [9 18 ];
M_.mapping.Prreal.eqidx = [18 ];
M_.mapping.P.eqidx = [1 4 8 9 10 11 15 16 17 18 19 ];
M_.mapping.pi.eqidx = [2 11 13 ];
M_.mapping.tfp.eqidx = [5 7 12 ];
M_.mapping.mon.eqidx = [13 14 ];
M_.mapping.tfp_shock.eqidx = [12 ];
M_.mapping.mon_shock.eqidx = [14 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 10 16 18 19 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(16, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [71; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([3 5 6 13 8 9 10 11 12 14 5 8 9 10 3 4 5 6 1 2 4 10 3 10 4 6 7 15 15 6 7 16 16 2 13 17 17 7 8 9 19 19 9 18 18 4 8 9 10 11 15 16 17 18 19 11 5 7 12 13 14 8 1 2 1 1 8 2 13 12 14 ]);
M_.dynamic_g1_sparse_colval = int32([2 2 2 10 16 16 16 16 18 19 20 20 20 20 21 22 22 22 23 23 23 23 24 24 25 25 25 25 26 27 27 27 28 29 29 29 30 31 31 31 31 32 33 33 34 35 35 35 35 35 35 35 35 35 35 36 37 37 37 38 38 39 42 42 46 54 54 55 55 58 59 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 4 4 4 4 4 4 4 4 5 5 5 5 5 5 9 9 10 11 15 16 19 23 25 29 30 33 34 37 38 42 43 45 46 56 57 60 62 63 63 63 65 65 65 65 66 66 66 66 66 66 66 66 68 70 70 70 71 72 ]);
M_.lhs = {
'(C(1)/C)^theta-betta*(1+R(1)/P(1)-delta)'; 
'(C(1)/C)^theta-betta*Rb/pi(1)'; 
'K-(1-delta)*K(-1)-I'; 
'phi*L^psi*C^theta-W/P'; 
'Y-L^(1-alpha)*tfp*K(-1)^alpha'; 
'K(-1)/L-W/R*alpha/(1-alpha)'; 
'MC-1/tfp*(W/(1-alpha))^(1-alpha)*(R/alpha)^alpha'; 
'1-nu+MC*nu/P-P/P(-1)*mu*(P/P(-1)-1)+betta*mu*(P(1)/P-1)*(P(1)/P)^2*Y(1)/Y'; 
'Pr'; 
'Y-C-I-Y*mu/2*(P/P(-1)-1)^2'; 
'pi'; 
'log(tfp)'; 
'Rb/Rss'; 
'log(mon)'; 
'Wreal'; 
'Rreal'; 
'Rbreal'; 
'Prreal'; 
'MCreal'; 
};
M_.static_tmp_nbr = [12; 1; 0; 0; ];
M_.static_g1_sparse_rowval = int32([5 9 10 3 5 6 4 5 6 4 10 3 10 4 6 7 15 15 1 6 7 16 16 2 13 17 17 7 8 9 19 19 9 18 18 1 4 8 9 15 16 17 18 19 2 11 13 5 7 12 13 14 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 4 4 5 5 6 6 6 6 7 8 8 8 8 9 10 10 10 11 12 12 12 12 13 14 14 15 16 16 16 16 16 16 16 16 16 17 17 17 18 18 18 19 19 ]);
M_.static_g1_sparse_colptr = int32([1 4 7 10 12 14 18 19 23 24 27 28 32 33 35 36 45 48 51 53 ]);
M_.params(1) = 0.35;
alpha = M_.params(1);
M_.params(2) = 0.98;
betta = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 1.25;
theta = M_.params(4);
M_.params(5) = 0.5;
psi = M_.params(5);
M_.params(6) = 16.0;
phi = M_.params(6);
M_.params(7) = 6.0;
nu = M_.params(7);
M_.params(8) = 30.0;
mu = M_.params(8);
M_.params(9) = 0.2;
rho_tfp = M_.params(9);
M_.params(10) = 0.0;
rho_mon = M_.params(10);
M_.params(11) = 0.001;
sig_tfp = M_.params(11);
M_.params(13) = 0.8;
gamma = M_.params(13);
M_.params(14) = 1.5;
tau = M_.params(14);
M_.params(15) = 1.0;
piss = M_.params(15);
M_.params(16) = 1/M_.params(2);
Rss = M_.params(16);
M_.params(12) = 0.0025;
sig_mon = M_.params(12);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(11)^2;
M_.Sigma_e(2, 2) = M_.params(12)^2;
options_.irf = 40;
options_.nograph = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
if ~exist('plots_absolute', 'dir')
mkdir('plots_absolute');
end
vars = {'Y','K','L','C','I','W','Wreal','R','Rreal','Rb','Rbreal','MC','MCreal','Pr','Prreal','P','pi','tfp','mon'};
shock_list = {'tfp_shock','mon_shock'};
T = options_.irf;
ss = oo_.steady_state;
for s = 1:length(shock_list)
shock_name = shock_list{s};
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
level_plot = [ss(idx); level]; 
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
print(f1, fullfile('plots_absolute', ['absolute_figure_1_' shock_name '.png']), '-dpng', '-r300');
close(f1);
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
level_plot = [ss(idx); level]; 
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
print(f2, fullfile('plots_absolute', ['absolute_figure_2_' shock_name '.png']), '-dpng', '-r300');
close(f2);
f3 = figure('visible', 'off');
set(f3, 'Position', [80 80 1800 1000]);
varname = 'mon';
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
ss = oo_.dr.ys;                 
Ex = zeros(T, M_.exo_nbr);      
Ex(1, strmatch('tfp_shock', M_.exo_names, 'exact')) = sig_tfp;
Ex(1, strmatch('mon_shock', M_.exo_names, 'exact')) = sig_mon;
Yjoint = simult_(M_, options_, ss, oo_.dr, Ex, 1);
vars = {'Y','K','L','C','I','W','Wreal','R','Rreal','Rb','Rbreal','MC','MCreal','Pr','Prreal','P','pi','tfp','mon'};
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


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_RPMP_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end

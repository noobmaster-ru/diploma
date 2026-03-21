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
M_.fname = 'RBC';
M_.dynare_version = '6.5';
oo_.dynare_version = '6.5';
options_.dynare_version = '6.5';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'tfp_shock'};
M_.exo_names_tex(1) = {'tfp\_shock'};
M_.exo_names_long(1) = {'tfp_shock'};
M_.endo_names = cell(10,1);
M_.endo_names_tex = cell(10,1);
M_.endo_names_long = cell(10,1);
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
M_.endo_names(7) = {'R'};
M_.endo_names_tex(7) = {'R'};
M_.endo_names_long(7) = {'R'};
M_.endo_names(8) = {'P'};
M_.endo_names_tex(8) = {'P'};
M_.endo_names_long(8) = {'P'};
M_.endo_names(9) = {'MC'};
M_.endo_names_tex(9) = {'MC'};
M_.endo_names_long(9) = {'MC'};
M_.endo_names(10) = {'tfp'};
M_.endo_names_tex(10) = {'tfp'};
M_.endo_names_long(10) = {'tfp'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
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
M_.param_names(9) = {'rho'};
M_.param_names_tex(9) = {'rho'};
M_.param_names_long(9) = {'rho'};
M_.param_names(10) = {'sig_tfp'};
M_.param_names_tex(10) = {'sig\_tfp'};
M_.param_names_long(10) = {'sig_tfp'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 10;
M_.param_nbr = 10;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.predetermined_variables = [ 2 ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
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
M_.eq_nbr = 10;
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
 0 4 14;
 1 5 0;
 0 6 0;
 0 7 15;
 0 8 0;
 0 9 0;
 0 10 16;
 2 11 17;
 0 12 0;
 3 13 0;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [11; 1; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
};
M_.mapping.Y.eqidx = [4 5 8 9 ];
M_.mapping.K.eqidx = [2 4 5 6 ];
M_.mapping.L.eqidx = [3 4 5 6 ];
M_.mapping.C.eqidx = [1 3 4 9 ];
M_.mapping.I.eqidx = [2 4 9 ];
M_.mapping.W.eqidx = [3 4 6 7 ];
M_.mapping.R.eqidx = [1 4 6 7 ];
M_.mapping.P.eqidx = [1 3 4 8 ];
M_.mapping.MC.eqidx = [4 7 8 ];
M_.mapping.tfp.eqidx = [5 10 ];
M_.mapping.tfp_shock.eqidx = [10 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 3;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 10];
M_.block_structure.block(1).variable = [ 10];
M_.block_structure.block(1).is_linear = false;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [0 1 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 9;
M_.block_structure.block(2).mfs = 9;
M_.block_structure.block(2).equation = [ 3 4 5 7 2 8 6 9 1];
M_.block_structure.block(2).variable = [ 6 5 3 9 2 8 7 1 4];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 40;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [5 6 10 11 12 13 14 15 16 17 18 24 25 26 27 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 3 5 7 6 1 2 4 7 2 5 8 1 2 3 7 2 4 6 5 1 2 6 9 2 4 7 2 3 6 8 1 2 8 9 6 9 9 6 9 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([5 5 5 5 6 10 10 10 10 11 11 11 12 12 12 12 13 13 13 14 15 15 15 15 16 16 16 17 17 17 17 18 18 18 18 24 24 25 26 27 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 1 5 6 6 6 6 10 13 17 20 21 25 28 32 36 36 36 36 36 36 38 39 40 41 ]);
M_.block_structure.variable_reordered = [ 10 6 5 3 9 2 8 7 1 4];
M_.block_structure.equation_reordered = [ 10 3 4 5 7 2 8 6 9 1];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 2 2;
 4 2;
 5 2;
 6 2;
 8 8;
 10 10;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 4;
 1 8;
 2 2;
 2 5;
 3 3;
 3 4;
 3 6;
 3 8;
 4 1;
 4 3;
 4 4;
 4 5;
 4 6;
 4 7;
 4 8;
 4 9;
 5 1;
 5 3;
 5 10;
 6 3;
 6 6;
 6 7;
 7 6;
 7 7;
 7 9;
 8 1;
 8 8;
 8 9;
 9 1;
 9 4;
 9 5;
 10 10;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 4;
 1 7;
 1 8;
 8 1;
 8 8;
];
M_.block_structure.dyn_tmp_nbr = 8;
M_.state_var = [10 2 8 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(10, 1), 'log_deflator', cell(10, 1), 'growth_factor', cell(10, 1), 'log_growth_factor', cell(10, 1));
M_.NNZDerivatives = [44; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 4 5 6 8 10 4 5 8 9 2 3 4 5 6 1 3 4 9 2 4 9 3 4 6 7 4 6 7 1 3 4 8 4 7 8 5 10 8 1 1 1 8 10 ]);
M_.dynamic_g1_sparse_colval = int32([2 2 2 2 8 10 11 11 11 11 12 13 13 13 13 14 14 14 14 15 15 15 16 16 16 16 17 17 17 18 18 18 18 19 19 19 20 20 21 24 27 28 28 31 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 5 5 5 5 5 5 6 6 7 11 12 16 20 23 27 30 34 37 39 40 40 40 41 41 41 42 44 44 44 45 ]);
M_.lhs = {
'(C(1)/C)^theta-betta*(1+R(1)-delta)*P(1)/P'; 
'K-(1-delta)*K(-1)-I'; 
'phi*L^psi*C^theta-W/P'; 
'P*Y*(1-MC)+L*W+R*K(-1)-C*P-P*I'; 
'Y-L^(1-alpha)*tfp*K(-1)^alpha'; 
'K(-1)/L-W/R*alpha/(1-alpha)'; 
'MC-(W/(1-alpha))^(1-alpha)*(R/alpha)^alpha'; 
'1-nu+MC*nu/P-P/P(-1)*mu*(P/P(-1)-1)+betta*mu*(P(1)/P-1)*(P(1)/P)^2*Y(1)/Y'; 
'Y-C-I'; 
'log(tfp)'; 
};
M_.static_tmp_nbr = [7; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 1];
M_.block_structure_stat.block(1).variable = [ 7];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 10];
M_.block_structure_stat.block(2).variable = [ 10];
M_.block_structure_stat.block(3).Simulation_Type = 6;
M_.block_structure_stat.block(3).endo_nbr = 8;
M_.block_structure_stat.block(3).mfs = 8;
M_.block_structure_stat.block(3).equation = [ 3 4 5 6 7 8 9 2];
M_.block_structure_stat.block(3).variable = [ 6 1 2 3 9 8 4 5];
M_.block_structure_stat.variable_reordered = [ 7 10 6 1 2 3 9 8 4 5];
M_.block_structure_stat.equation_reordered = [ 1 10 3 4 5 6 7 8 9 2];
M_.block_structure_stat.incidence.sparse_IM = [
 1 7;
 2 2;
 2 5;
 3 3;
 3 4;
 3 6;
 3 8;
 4 1;
 4 2;
 4 3;
 4 4;
 4 5;
 4 6;
 4 7;
 4 8;
 4 9;
 5 1;
 5 2;
 5 3;
 5 10;
 6 2;
 6 3;
 6 6;
 6 7;
 7 6;
 7 7;
 7 9;
 8 8;
 8 9;
 9 1;
 9 4;
 9 5;
 10 10;
];
M_.block_structure_stat.tmp_nbr = 6;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 2 4 5 2 3 7 2 3 4 8 1 2 3 4 2 5 6 1 2 6 1 2 7 2 7 8 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 1 1 1 2 2 2 3 3 3 3 4 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 5 8 12 16 19 22 25 28 ]);
M_.static_g1_sparse_rowval = int32([4 5 9 2 4 5 6 3 4 5 6 3 4 9 2 4 9 3 4 6 7 1 4 6 7 3 4 8 4 7 8 5 10 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 2 2 3 3 3 3 4 4 4 5 5 5 6 6 6 6 7 7 7 7 8 8 8 9 9 9 10 10 ]);
M_.static_g1_sparse_colptr = int32([1 4 8 12 15 18 22 26 29 32 34 ]);
M_.params(1) = 0.45;
alpha = M_.params(1);
M_.params(2) = 0.96;
betta = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(5) = 0.35;
psi = M_.params(5);
M_.params(6) = 100.0;
phi = M_.params(6);
M_.params(7) = 6.0;
nu = M_.params(7);
M_.params(8) = 5.0;
mu = M_.params(8);
M_.params(4) = 2.00;
theta = M_.params(4);
M_.params(9) = 0.9;
rho = M_.params(9);
M_.params(10) = 0.10;
sig_tfp = M_.params(10);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(10) = 1;
oo_.steady_state(8) = 1;
oo_.steady_state(9) = (M_.params(7)-1)/M_.params(7);
oo_.steady_state(7) = 1/M_.params(2)-1+M_.params(3);
oo_.steady_state(3) = 0.1;
oo_.steady_state(2) = 1.0;
oo_.steady_state(5) = M_.params(3)*oo_.steady_state(2);
oo_.steady_state(1) = oo_.steady_state(10)*oo_.steady_state(2)^M_.params(1)*oo_.steady_state(3)^(1-M_.params(1));
oo_.steady_state(4) = oo_.steady_state(1)-oo_.steady_state(5);
oo_.steady_state(6) = M_.params(6)*oo_.steady_state(3)^M_.params(5)*oo_.steady_state(4)^M_.params(4)*oo_.steady_state(8);
oo_.exo_steady_state(1) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(10)^2;
set(0, 'defaultfigurevisible', 'off');
options_.irf = 40;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
set(0, 'defaultfigurevisible', 'on');
if ~exist('plots_absolute', 'dir')
mkdir('plots_absolute');
end
vars = {'Y','K','L','C','I','W','R','P','MC','tfp'};
shock_name = 'tfp_shock';
T = options_.irf;
ss = oo_.steady_state;
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


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end

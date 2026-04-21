var Y K L C I W R Pr MC tfp;
varexo tfp_shock;
predetermined_variables K;
parameters alpha betta delta theta psi phi rho_tfp sig_tfp;
alpha   = 0.33;
betta   = 0.95;
delta   = 0.025;
theta   = 1.25;
psi     = 0.75;
phi     = 5.0;
rho_tfp = 0.7;
sig_tfp = 0.2;

model;
(C(+1)/C)^theta - betta*(R(+1)+1-delta) = 0;
K(+1) - (1-delta)*K - I = 0;
phi*(L^psi)*(C^theta) - W = 0;
Y - tfp*K^alpha*L^(1-alpha) = 0;
R = alpha*K^(alpha-1)*L^(1-alpha);
W = (1-alpha)*K^alpha*L^(-alpha);
Y - C - I = 0;
Pr = Y - R*K - W*L;
MC = (1/tfp)*(W/(1-alpha))^(1-alpha)*(R/alpha)^(alpha);
tfp = tfp(-1)^rho_tfp * exp(tfp_shock);
end;

steady_state_model;
R = 1/betta + delta - 1;
tfp = 1;
MC = 1;
W = ((1-alpha)^(1-alpha)*alpha^alpha/R^alpha)^(1/(1-alpha));
K2L = (W/R)*alpha/(1-alpha);
C2L = K2L^alpha - delta*K2L;
L = ((W/phi)/(C2L^theta))^(1/(psi+theta));
K = K2L*L;
C = C2L*L;
Y = K^alpha*L^(1-alpha);
I = delta*K;
Pr = Y - R*K - W*L;
end;

steady;

shocks;
var tfp_shock = sig_tfp^2;
end;

stoch_simul(irf=40);
Y_irf = oo_.irfs.Y_tfp_shock;
C_irf = oo_.irfs.C_tfp_shock;
I_irf = oo_.irfs.I_tfp_shock;
L_irf = oo_.irfs.L_tfp_shock;
save('dynare_irf.mat', 'Y_irf', 'C_irf', 'I_irf', 'L_irf');


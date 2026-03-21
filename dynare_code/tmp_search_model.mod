var Y K L C I W R P MC tfp;
varexo tfp_shock;
predetermined_variables K;

parameters alpha betta delta theta psi phi nu mu rho sig_tfp;
alpha   = 0.4188843703050096;
betta   = 0.9889488600735076;
delta   = 0.0268228632332338;
theta   = 1.517833500585927;
psi     = 0.8157846099160518;
phi     = 20.30621345877567;
nu      = 6.49740019379167;
mu      = 3.381470897749811;
rho     = 0.8382131167041832;
sig_tfp = 0.06042129374822796;

model;
    (C(+1)/C)^theta - betta*(R(+1)+1-delta)*P(+1)/P = 0;
    K(+1) - (1-delta)*K - I = 0;
    phi*L^psi*C^theta - W/P = 0;
    W*L + R*K + P*Y*(1-MC) - P*C - I = 0;
    Y - tfp*K^alpha*L^(1-alpha) = 0;
    K/L - (W/R)*(alpha/(1-alpha)) = 0;
    MC - (W/(1-alpha))^(1-alpha)*(R/alpha)^(alpha) = 0;
    (1-nu) + nu*MC/P - mu*(P/P(-1)-1)*(P/P(-1)) + betta*mu*(P(+1)/P-1)*((P(+1)/P)^2)*(Y(+1)/Y) = 0;
    P*Y - P*C - I = 0;
    log(tfp) = rho*log(tfp(-1)) + tfp_shock;
end;

initval;
    tfp = 1;
    P   = 1;
    MC  = max((nu-1)/nu, 0.05);
    R   = max(1/betta - 1 + delta, 0.001);
    L   = 0.30;
    K   = 5.00;
    I   = delta*K;
    Y   = tfp*K^alpha*L^(1-alpha);
    C   = max(Y - I, 0.10);
    W   = (1-alpha)*MC*(K/L)^alpha;
    tfp_shock = 0;
end;

steady(maxit=200);

shocks;
    var tfp_shock = sig_tfp^2;
end;

stoch_simul(order=1, irf=0, nograph, nomoments, nocorr, nodecomposition);

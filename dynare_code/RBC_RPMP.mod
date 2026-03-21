clc
var Y K L C I W Wreal R Rreal Rb Rbreal MC MCreal Pr Prreal P pi tfp mon;
varexo tfp_shock mon_shock;
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
    (C(+1)/C)^theta - betta*(R(+1)/P(+1)+1-delta) =     Rss     = 1/betta;
    sig_mon = 0.0025 ;0;
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
    log(tfp) = rho_tfp*log(tfp(-1))+tfp_shock;
    (Rb/Rss) = mon*((Rb(-1)/Rss)^gamma)*(pi(+1)/piss)^(tau*(1-gamma));
    log(mon) = rho_mon*log(mon(-1)) + mon_shock;
    Wreal = W/P;
    Rreal = R/P;
    Rbreal= Rb/P;
    Prreal= Pr/P;
    MCreal= MC/P;
    //Pr+ W*L+R*K-P*C-P*I = 0;
end;

steady_state_model;
    Rb=1/betta;
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

shocks;
var tfp_shock=sig_tfp^2;
var mon_shock=sig_mon^2;
end;

stoch_simul;
//dynare RBC_RPMP

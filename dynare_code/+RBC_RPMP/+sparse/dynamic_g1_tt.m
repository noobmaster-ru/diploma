function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC_RPMP.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 47
    T = [T; NaN(47 - size(T, 1), 1)];
end
T(22) = getPowerDeriv(y(2),params(1),1);
T(23) = y(37)*T(22);
T(24) = params(6)*getPowerDeriv(y(22),params(5),1);
T(25) = getPowerDeriv(y(22),1-params(1),1);
T(26) = (-y(42))/(y(23)*y(23));
T(27) = getPowerDeriv(y(42)/y(23),params(4),1);
T(28) = getPowerDeriv(y(23),params(4),1);
T(29) = 1/y(35);
T(30) = (-T(29));
T(31) = 1/(1-params(1))*getPowerDeriv(y(25)/(1-params(1)),1-params(1),1);
T(32) = T(6)*T(31);
T(33) = 1/params(1)*getPowerDeriv(y(27)/params(1),params(1),1);
T(34) = 1/params(16);
T(35) = T(34)*getPowerDeriv(y(10)/params(16),params(13),1);
T(36) = y(38)*T(35);
T(37) = (-y(35))/(y(16)*y(16));
T(38) = T(15)*T(37)*2*(T(10)-1);
T(39) = 1/y(16);
T(40) = (-y(54))/(y(35)*y(35));
T(41) = 2*y(54)/y(35);
T(42) = T(40)*T(41);
T(43) = T(12)*params(2)*params(8)*T(40)+T(11)*T(42);
T(44) = T(15)*2*(T(10)-1)*T(39);
T(45) = T(29)*T(41);
T(46) = T(12)*params(2)*params(8)*T(29)+T(11)*T(45);
T(47) = 1/params(15)*getPowerDeriv(y(55)/params(15),params(14)*(1-params(13)),1);
end

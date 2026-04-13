function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC_RPMP.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 49
    T = [T; NaN(49 - size(T, 1), 1)];
end
T(24) = getPowerDeriv(y(2),params(1),1);
T(25) = y(37)*T(24);
T(26) = (-y(21))/(y(2)*y(2));
T(27) = 2*(y(21)/y(2)-1);
T(28) = params(6)*getPowerDeriv(y(22),params(5),1);
T(29) = getPowerDeriv(y(22),1-params(1),1);
T(30) = (-y(42))/(y(23)*y(23));
T(31) = getPowerDeriv(y(42)/y(23),params(4),1);
T(32) = getPowerDeriv(y(23),params(4),1);
T(33) = 1/y(35);
T(34) = (-T(33));
T(35) = 1/(1-params(1))*getPowerDeriv(y(25)/(1-params(1)),1-params(1),1);
T(36) = T(6)*T(35);
T(37) = 1/params(1)*getPowerDeriv(y(27)/params(1),params(1),1);
T(38) = 1/params(16);
T(39) = T(38)*getPowerDeriv(y(10)/params(16),params(13),1);
T(40) = y(38)*T(39);
T(41) = (-y(35))/(y(16)*y(16));
T(42) = 1/y(16);
T(43) = (-y(54))/(y(35)*y(35));
T(44) = 2*y(54)/y(35);
T(45) = T(43)*T(44);
T(46) = T(12)*params(2)*params(8)*T(43)+T(11)*T(45);
T(47) = T(33)*T(44);
T(48) = T(12)*params(2)*params(8)*T(33)+T(11)*T(47);
T(49) = 1/params(15)*getPowerDeriv(y(55)/params(15),params(14)*(1-params(13)),1);
end

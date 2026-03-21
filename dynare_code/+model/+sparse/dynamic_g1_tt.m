function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 31
    T = [T; NaN(31 - size(T, 1), 1)];
end
T(14) = getPowerDeriv(y(2),params(1),1);
T(15) = y(20)*T(14);
T(16) = params(6)*getPowerDeriv(y(13),params(5),1);
T(17) = getPowerDeriv(y(13),1-params(1),1);
T(18) = (-y(24))/(y(14)*y(14));
T(19) = getPowerDeriv(y(24)/y(14),params(4),1);
T(20) = getPowerDeriv(y(14),params(4),1);
T(21) = 1/y(18);
T(22) = 1/(1-params(1))*getPowerDeriv(y(16)/(1-params(1)),1-params(1),1);
T(23) = 1/params(1)*getPowerDeriv(y(17)/params(1),params(1),1);
T(24) = (-y(18))/(y(8)*y(8));
T(25) = 1/y(8);
T(26) = (-y(28))/(y(18)*y(18));
T(27) = 2*y(28)/y(18);
T(28) = T(26)*T(27);
T(29) = T(9)*params(2)*params(8)*T(26)+T(8)*T(28);
T(30) = T(21)*T(27);
T(31) = T(9)*params(2)*params(8)*T(21)+T(8)*T(30);
end

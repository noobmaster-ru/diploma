function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC_upd.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 21
    T = [T; NaN(21 - size(T, 1), 1)];
end
T(11) = getPowerDeriv(y(2),params(1),1);
T(12) = params(1)*getPowerDeriv(y(2),params(1)-1,1);
T(13) = params(6)*getPowerDeriv(y(13),params(5),1);
T(14) = getPowerDeriv(y(13),1-params(1),1);
T(15) = getPowerDeriv(y(13),(-params(1)),1);
T(16) = (-y(24))/(y(14)*y(14));
T(17) = getPowerDeriv(y(24)/y(14),params(4),1);
T(18) = getPowerDeriv(y(14),params(4),1);
T(19) = 1/(1-params(1))*getPowerDeriv(y(16)/(1-params(1)),1-params(1),1);
T(20) = T(5)*T(19);
T(21) = 1/params(1)*getPowerDeriv(y(17)/params(1),params(1),1);
end

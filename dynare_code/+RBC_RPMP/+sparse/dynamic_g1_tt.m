function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC_RPMP.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 23
    T = [T; NaN(23 - size(T, 1), 1)];
end
T(18) = getPowerDeriv(y(42)/y(23),params(4),1);
T(19) = (-(1/y(35)));
T(20) = (-y(35))/(y(16)*y(16));
T(21) = params(8)/2*T(20)*2*(T(8)-1);
T(22) = 1/y(16);
T(23) = params(8)/2*2*(T(8)-1)*T(22);
end

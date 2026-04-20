function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = RBC.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 25
    T = [T; NaN(25 - size(T, 1), 1)];
end
T(23) = getPowerDeriv(y(24)/y(14),params(4),2);
T(24) = getPowerDeriv(y(2),params(1),2);
T(25) = getPowerDeriv(y(13),1-params(1),2);
end

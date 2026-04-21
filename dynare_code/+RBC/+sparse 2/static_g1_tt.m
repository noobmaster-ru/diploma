function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(10) = getPowerDeriv(y(2),params(1),1);
T(11) = getPowerDeriv(y(3),1-params(1),1);
end

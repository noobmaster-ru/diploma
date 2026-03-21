function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = model.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 33
    T = [T; NaN(33 - size(T, 1), 1)];
end
T(32) = getPowerDeriv(y(24)/y(14),params(4),2);
T(33) = T(24)*params(8)*T(24);
end

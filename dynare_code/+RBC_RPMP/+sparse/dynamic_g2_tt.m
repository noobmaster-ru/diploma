function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = RBC_RPMP.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 54
    T = [T; NaN(54 - size(T, 1), 1)];
end
T(48) = getPowerDeriv(y(42)/y(23),params(4),2);
T(49) = T(27)*(-((-y(42))*(y(23)+y(23))))/(y(23)*y(23)*y(23)*y(23))+T(26)*T(26)*T(48);
T(50) = T(27)*(-1)/(y(23)*y(23))+T(26)*1/y(23)*T(48);
T(51) = 1/y(23)*1/y(23)*T(48);
T(52) = (-((-1)/(y(35)*y(35))));
T(53) = (-((-y(35))*(y(16)+y(16))))/(y(16)*y(16)*y(16)*y(16));
T(54) = (-1)/(y(16)*y(16));
end

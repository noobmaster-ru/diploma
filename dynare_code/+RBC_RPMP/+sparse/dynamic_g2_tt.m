function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = RBC_RPMP.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 56
    T = [T; NaN(56 - size(T, 1), 1)];
end
T(50) = getPowerDeriv(y(42)/y(23),params(4),2);
T(51) = T(31)*(-((-y(42))*(y(23)+y(23))))/(y(23)*y(23)*y(23)*y(23))+T(30)*T(30)*T(50);
T(52) = T(31)*(-1)/(y(23)*y(23))+T(30)*1/y(23)*T(50);
T(53) = 1/y(23)*1/y(23)*T(50);
T(54) = (-((-1)/(y(35)*y(35))));
T(55) = (-((-y(35))*(y(16)+y(16))))/(y(16)*y(16)*y(16)*y(16));
T(56) = (-1)/(y(16)*y(16));
end

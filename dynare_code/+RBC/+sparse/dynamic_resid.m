function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(10, 1);
end
[T_order, T] = RBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(10, 1);
residual(1) = (y(24)/y(14))^params(4)-params(2)*(1+y(27)-params(3));
residual(2) = y(12)-(1-params(3))*y(2)-y(15);
residual(3) = T(1)*T(2)-y(16);
residual(4) = y(11)-T(3)*y(20)*T(9);
    residual(5) = (y(17)) - (T(3)*T(10));
    residual(6) = (y(16)) - (T(4)*(1-params(1))*T(9));
residual(7) = y(11)-y(14)-y(15);
    residual(8) = (y(18)) - (y(11)-y(17)*y(2)-y(13)*y(16));
    residual(9) = (y(19)) - (T(6)*T(7));
    residual(10) = (y(20)) - (T(8));
end

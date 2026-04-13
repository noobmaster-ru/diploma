function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(10, 1);
end
[T_order, T] = RBC_upd.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(10, 1);
residual(1) = 1-params(2)*(1+y(7)-params(3));
residual(2) = y(2)-y(2)*(1-params(3))-y(5);
residual(3) = T(1)*T(2)-y(6);
residual(4) = y(1)-T(3)*y(10)*T(4);
    residual(5) = (y(7)) - (T(3)*T(5));
    residual(6) = (y(6)) - (T(6)*(1-params(1))*T(4));
residual(7) = y(1)-y(4)-y(5);
    residual(8) = (y(8)) - (y(1)-y(7)*y(2)-y(3)*y(6));
    residual(9) = (y(9)) - (T(9)*T(10));
    residual(10) = (log(y(10))) - (log(y(10))*params(7)+x(1));
end

function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = RBC_RPMP.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(19, 1);
residual(1) = 1-params(2)*(1+y(8)/y(16)-params(3));
residual(2) = 1-params(2)*y(10)/y(17);
residual(3) = y(2)-y(2)*(1-params(3))-y(5);
residual(4) = T(1)*T(2)-y(6)/y(16);
residual(5) = y(1)-T(3)*T(5);
residual(6) = y(2)/y(3)-y(6)/y(8)*params(1)/(1-params(1));
residual(7) = y(12)-T(8)*T(9);
residual(8) = 1-params(7)+y(12)*params(7)/y(16);
    residual(9) = (y(14)) - (y(1)*(y(16)-y(12)));
residual(10) = y(1)-y(4)-y(5);
    residual(11) = (y(17)) - (1);
    residual(12) = (log(y(18))) - (log(y(18))*params(9)-x(1));
    residual(13) = (y(10)/params(16)) - (T(11)*T(12));
    residual(14) = (log(y(19))) - (log(y(19))*params(10)-x(2));
    residual(15) = (y(7)) - (y(6)/y(16));
    residual(16) = (y(9)) - (y(8)/y(16));
    residual(17) = (y(11)) - (y(10)/y(16));
    residual(18) = (y(15)) - (y(14)/y(16));
    residual(19) = (y(13)) - (y(12)/y(16));
end

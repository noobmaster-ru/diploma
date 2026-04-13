function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(23, 1);
end
[T_order, T] = RBC_RPMP.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(19, 1);
residual(1) = T(1)-params(2)*(1+y(46)/y(54)-params(3));
residual(2) = T(1)-params(2)*y(29)/y(55);
residual(3) = y(21)-(1-params(3))*y(2)-y(24);
residual(4) = T(2)*T(3)-y(25)/y(35);
residual(5) = y(20)-T(4)*T(23);
residual(6) = y(2)/y(22)-y(25)/y(27)*T(5);
residual(7) = y(31)-T(8)*T(9);
residual(8) = 1-params(7)+y(31)*params(7)/y(35)-T(10)*params(8)*(T(10)-1)+T(13)*T(14);
    residual(9) = (y(33)) - (y(20)*(y(35)-y(31))-y(20)*T(17));
residual(10) = y(20)-y(23)-y(24)-T(18)*(y(21)/y(2)-1)^2;
    residual(11) = (y(36)) - (T(10));
    residual(12) = (log(y(37))) - (params(9)*log(y(18))+x(1));
    residual(13) = (y(29)/params(16)) - (T(20)*T(21));
    residual(14) = (log(y(38))) - (params(10)*log(y(19))+x(2));
    residual(15) = (y(26)) - (y(25)/y(35));
    residual(16) = (y(28)) - (y(27)/y(35));
    residual(17) = (y(30)) - (y(29)/y(35));
    residual(18) = (y(34)) - (y(33)/y(35));
    residual(19) = (y(32)) - (y(31)/y(35));
end

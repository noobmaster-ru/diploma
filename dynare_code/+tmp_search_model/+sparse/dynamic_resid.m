function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = tmp_search_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(10, 1);
residual(1) = (y(24)/y(14))^params(4)-params(2)*(1+y(27)-params(3))*y(28)/y(18);
residual(2) = y(12)-(1-params(3))*y(2)-y(15);
residual(3) = T(1)*T(2)-y(16)/y(18);
residual(4) = y(18)*y(11)*(1-y(19))+y(13)*y(16)+y(17)*y(2)-y(14)*y(18)-y(15);
residual(5) = y(11)-T(3)*T(11);
residual(6) = y(2)/y(13)-y(16)/y(17)*params(1)/(1-params(1));
residual(7) = y(19)-T(4)*T(5);
residual(8) = 1-params(7)+y(19)*params(7)/y(18)-T(6)*params(8)*(T(6)-1)+T(9)*y(21)/y(11);
residual(9) = y(18)*y(11)-y(14)*y(18)-y(15);
    residual(10) = (log(y(20))) - (params(9)*log(y(10))+x(1));
end

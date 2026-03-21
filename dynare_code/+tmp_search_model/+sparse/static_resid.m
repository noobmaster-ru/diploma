function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = tmp_search_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(10, 1);
residual(1) = 1-params(2)*(1+y(7)-params(3));
residual(2) = y(2)-y(2)*(1-params(3))-y(5);
residual(3) = T(1)*T(2)-y(6)/y(8);
residual(4) = y(8)*y(1)*(1-y(9))+y(3)*y(6)+y(7)*y(2)-y(4)*y(8)-y(5);
residual(5) = y(1)-T(3)*T(5);
residual(6) = y(2)/y(3)-y(6)/y(7)*params(1)/(1-params(1));
residual(7) = y(9)-T(6)*T(7);
residual(8) = 1-params(7)+y(9)*params(7)/y(8);
residual(9) = y(8)*y(1)-y(4)*y(8)-y(5);
    residual(10) = (log(y(10))) - (log(y(10))*params(9)+x(1));
end

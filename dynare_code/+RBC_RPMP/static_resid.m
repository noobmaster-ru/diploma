function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = RBC_RPMP.static_resid_tt(T, y, x, params);
end
residual = zeros(19, 1);
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
    residual(12) = (log(y(18))) - (log(y(18))*params(9)+x(1));
    residual(13) = (y(10)/params(16)) - (T(11)*T(12));
    residual(14) = (log(y(19))) - (log(y(19))*params(10)+x(2));
    residual(15) = (y(7)) - (y(6)/y(16));
    residual(16) = (y(9)) - (y(8)/y(16));
    residual(17) = (y(11)) - (y(10)/y(16));
    residual(18) = (y(15)) - (y(14)/y(16));
    residual(19) = (y(13)) - (y(12)/y(16));

end

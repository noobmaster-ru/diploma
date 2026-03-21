function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = model.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(10, 1);
residual(1) = (y(15)/y(7))^params(4)-params(2)*(1+y(16)-params(3))*y(17)/y(11);
residual(2) = y(5)-(1-params(3))*y(1)-y(8);
residual(3) = T(1)*T(2)-y(9)/y(11);
residual(4) = y(11)*y(4)*(1-y(12))+y(6)*y(9)+y(10)*y(1)-y(7)*y(11)-y(11)*y(8);
residual(5) = y(4)-T(3)*T(13);
residual(6) = y(1)/y(6)-y(9)/y(10)*T(4);
residual(7) = y(12)-T(5)*T(6);
residual(8) = 1-params(7)+y(12)*params(7)/y(11)-T(7)*params(8)*(T(7)-1)+T(10)*T(11);
residual(9) = y(4)-y(7)-y(8);
    residual(10) = (log(y(13))) - (params(9)*log(y(3))+x(it_, 1));

end

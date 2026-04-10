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
    T = RBC_RPMP.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
residual(1) = T(1)-params(2)*(1+y(27)/y(28)-params(3));
residual(2) = T(1)-params(2)*y(15)/y(29);
residual(3) = y(7)-(1-params(3))*y(1)-y(10);
residual(4) = T(2)*T(3)-y(11)/y(21);
residual(5) = y(6)-T(4)*T(21);
residual(6) = y(1)/y(8)-y(11)/y(13)*T(5);
residual(7) = y(17)-T(8)*T(9);
residual(8) = 1-params(7)+y(17)*params(7)/y(21)-T(10)*params(8)*(T(10)-1)+T(13)*T(14);
    residual(9) = (y(19)) - (y(6)*(y(21)-y(17))-y(6)*y(21)*T(16));
residual(10) = y(6)-y(9)-y(10)-y(6)*T(16);
    residual(11) = (y(22)) - (T(10));
    residual(12) = (log(y(23))) - (params(9)*log(y(4))+x(it_, 1));
    residual(13) = (y(15)/params(16)) - (T(18)*T(19));
    residual(14) = (log(y(24))) - (params(10)*log(y(5))+x(it_, 2));
    residual(15) = (y(12)) - (y(11)/y(21));
    residual(16) = (y(14)) - (y(13)/y(21));
    residual(17) = (y(16)) - (y(15)/y(21));
    residual(18) = (y(20)) - (y(19)/y(21));
    residual(19) = (y(18)) - (y(17)/y(21));

end

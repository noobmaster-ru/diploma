function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 17);

T(1) = (y(26)/y(9))^params(4);
T(2) = params(6)*y(8)^params(5);
T(3) = y(9)^params(4);
T(4) = y(8)^(1-params(1));
T(5) = (y(11)/(1-params(1)))^(1-params(1));
T(6) = 1/y(23)*T(5);
T(7) = (y(13)/params(1))^params(1);
T(8) = y(21)/y(3);
T(9) = params(2)*params(8)*(y(28)/y(21)-1);
T(10) = (y(28)/y(21))^2;
T(11) = T(9)*T(10);
T(12) = params(8)/2*(T(8)-1)^2;
T(13) = (y(2)/params(16))^params(13);
T(14) = y(24)*T(13);
T(15) = (y(29)/params(15))^(params(14)*(1-params(13)));
T(16) = y(1)^params(1);
T(17) = y(23)*T(16);

end

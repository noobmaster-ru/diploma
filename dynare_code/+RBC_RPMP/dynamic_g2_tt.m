function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 56);

T = RBC_RPMP.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(50) = getPowerDeriv(y(26)/y(9),params(4),2);
T(51) = T(31)*(-((-y(26))*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9))+T(30)*T(30)*T(50);
T(52) = T(31)*(-1)/(y(9)*y(9))+T(30)*1/y(9)*T(50);
T(53) = 1/y(9)*1/y(9)*T(50);
T(54) = (-((-1)/(y(21)*y(21))));
T(55) = (-((-y(21))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3));
T(56) = (-1)/(y(3)*y(3));

end

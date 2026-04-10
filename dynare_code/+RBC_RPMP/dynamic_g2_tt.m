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

assert(length(T) >= 54);

T = RBC_RPMP.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(48) = getPowerDeriv(y(26)/y(9),params(4),2);
T(49) = T(27)*(-((-y(26))*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9))+T(26)*T(26)*T(48);
T(50) = T(27)*(-1)/(y(9)*y(9))+T(26)*1/y(9)*T(48);
T(51) = 1/y(9)*1/y(9)*T(48);
T(52) = (-((-1)/(y(21)*y(21))));
T(53) = (-((-y(21))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3));
T(54) = (-1)/(y(3)*y(3));

end

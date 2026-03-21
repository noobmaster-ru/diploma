function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 31);

T = model.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(14) = getPowerDeriv(y(1),params(1),1);
T(15) = y(13)*T(14);
T(16) = params(6)*getPowerDeriv(y(6),params(5),1);
T(17) = getPowerDeriv(y(6),1-params(1),1);
T(18) = (-y(15))/(y(7)*y(7));
T(19) = getPowerDeriv(y(15)/y(7),params(4),1);
T(20) = getPowerDeriv(y(7),params(4),1);
T(21) = 1/y(11);
T(22) = 1/(1-params(1))*getPowerDeriv(y(9)/(1-params(1)),1-params(1),1);
T(23) = 1/params(1)*getPowerDeriv(y(10)/params(1),params(1),1);
T(24) = (-y(11))/(y(2)*y(2));
T(25) = 1/y(2);
T(26) = (-y(17))/(y(11)*y(11));
T(27) = 2*y(17)/y(11);
T(28) = T(26)*T(27);
T(29) = T(9)*params(2)*params(8)*T(26)+T(8)*T(28);
T(30) = T(21)*T(27);
T(31) = T(9)*params(2)*params(8)*T(21)+T(8)*T(30);

end

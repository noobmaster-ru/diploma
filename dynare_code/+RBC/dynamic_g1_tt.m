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

assert(length(T) >= 22);

T = RBC.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(11) = getPowerDeriv(y(1),params(1),1);
T(12) = params(1)*getPowerDeriv(y(1),params(1)-1,1);
T(13) = params(6)*getPowerDeriv(y(5),params(5),1);
T(14) = getPowerDeriv(y(5),1-params(1),1);
T(15) = getPowerDeriv(y(5),(-params(1)),1);
T(16) = (-y(13))/(y(6)*y(6));
T(17) = getPowerDeriv(y(13)/y(6),params(4),1);
T(18) = getPowerDeriv(y(6),params(4),1);
T(19) = 1/(1-params(1))*getPowerDeriv(y(8)/(1-params(1)),1-params(1),1);
T(20) = 1/y(12)*T(19);
T(21) = 1/params(1)*getPowerDeriv(y(9)/params(1),params(1),1);
T(22) = (-(exp(x(it_, 1))*getPowerDeriv(y(2),params(7),1)));

end

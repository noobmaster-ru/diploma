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

assert(length(T) >= 23);

T = RBC_RPMP.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(18) = getPowerDeriv(y(26)/y(9),params(4),1);
T(19) = (-(1/y(21)));
T(20) = (-y(21))/(y(3)*y(3));
T(21) = params(8)/2*T(20)*2*(T(8)-1);
T(22) = 1/y(3);
T(23) = params(8)/2*2*(T(8)-1)*T(22);

end

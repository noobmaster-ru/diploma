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

assert(length(T) >= 47);

T = RBC_RPMP.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(22) = getPowerDeriv(y(1),params(1),1);
T(23) = y(23)*T(22);
T(24) = params(6)*getPowerDeriv(y(8),params(5),1);
T(25) = getPowerDeriv(y(8),1-params(1),1);
T(26) = (-y(26))/(y(9)*y(9));
T(27) = getPowerDeriv(y(26)/y(9),params(4),1);
T(28) = getPowerDeriv(y(9),params(4),1);
T(29) = 1/y(21);
T(30) = (-T(29));
T(31) = 1/(1-params(1))*getPowerDeriv(y(11)/(1-params(1)),1-params(1),1);
T(32) = T(6)*T(31);
T(33) = 1/params(1)*getPowerDeriv(y(13)/params(1),params(1),1);
T(34) = 1/params(16);
T(35) = T(34)*getPowerDeriv(y(2)/params(16),params(13),1);
T(36) = y(24)*T(35);
T(37) = (-y(21))/(y(3)*y(3));
T(38) = T(15)*T(37)*2*(T(10)-1);
T(39) = 1/y(3);
T(40) = (-y(28))/(y(21)*y(21));
T(41) = 2*y(28)/y(21);
T(42) = T(40)*T(41);
T(43) = T(12)*params(2)*params(8)*T(40)+T(11)*T(42);
T(44) = T(15)*2*(T(10)-1)*T(39);
T(45) = T(29)*T(41);
T(46) = T(12)*params(2)*params(8)*T(29)+T(11)*T(45);
T(47) = 1/params(15)*getPowerDeriv(y(29)/params(15),params(14)*(1-params(13)),1);

end

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

assert(length(T) >= 49);

T = RBC_RPMP.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(24) = getPowerDeriv(y(1),params(1),1);
T(25) = y(23)*T(24);
T(26) = (-y(7))/(y(1)*y(1));
T(27) = 2*(y(7)/y(1)-1);
T(28) = params(6)*getPowerDeriv(y(8),params(5),1);
T(29) = getPowerDeriv(y(8),1-params(1),1);
T(30) = (-y(26))/(y(9)*y(9));
T(31) = getPowerDeriv(y(26)/y(9),params(4),1);
T(32) = getPowerDeriv(y(9),params(4),1);
T(33) = 1/y(21);
T(34) = (-T(33));
T(35) = 1/(1-params(1))*getPowerDeriv(y(11)/(1-params(1)),1-params(1),1);
T(36) = T(6)*T(35);
T(37) = 1/params(1)*getPowerDeriv(y(13)/params(1),params(1),1);
T(38) = 1/params(16);
T(39) = T(38)*getPowerDeriv(y(2)/params(16),params(13),1);
T(40) = y(24)*T(39);
T(41) = (-y(21))/(y(3)*y(3));
T(42) = 1/y(3);
T(43) = (-y(28))/(y(21)*y(21));
T(44) = 2*y(28)/y(21);
T(45) = T(43)*T(44);
T(46) = T(12)*params(2)*params(8)*T(43)+T(11)*T(45);
T(47) = T(33)*T(44);
T(48) = T(12)*params(2)*params(8)*T(33)+T(11)*T(47);
T(49) = 1/params(15)*getPowerDeriv(y(29)/params(15),params(14)*(1-params(13)),1);

end

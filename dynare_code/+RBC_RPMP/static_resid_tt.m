function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 12);

T(1) = params(6)*y(3)^params(5);
T(2) = y(4)^params(4);
T(3) = y(3)^(1-params(1));
T(4) = y(2)^params(1);
T(5) = y(18)*T(4);
T(6) = 1/y(18);
T(7) = (y(6)/(1-params(1)))^(1-params(1));
T(8) = T(6)*T(7);
T(9) = (y(8)/params(1))^params(1);
T(10) = (y(10)/params(16))^params(13);
T(11) = y(19)*T(10);
T(12) = (y(17)/params(15))^(params(14)*(1-params(13)));

end

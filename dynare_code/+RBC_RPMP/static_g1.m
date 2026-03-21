function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = RBC_RPMP.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,8)=(-(params(2)*1/y(16)));
g1(1,16)=(-(params(2)*(-y(8))/(y(16)*y(16))));
g1(2,10)=(-(params(2)*1/y(17)));
g1(2,17)=(-(params(2)*(-y(10))/(y(17)*y(17))));
g1(3,2)=1-(1-params(3));
g1(3,5)=(-1);
g1(4,3)=T(2)*params(6)*getPowerDeriv(y(3),params(5),1);
g1(4,4)=T(1)*getPowerDeriv(y(4),params(4),1);
g1(4,6)=T(13);
g1(4,16)=(-((-y(6))/(y(16)*y(16))));
g1(5,1)=1;
g1(5,2)=(-(T(3)*y(18)*getPowerDeriv(y(2),params(1),1)));
g1(5,3)=(-(T(5)*getPowerDeriv(y(3),1-params(1),1)));
g1(5,18)=(-(T(3)*T(4)));
g1(6,2)=1/y(3);
g1(6,3)=(-y(2))/(y(3)*y(3));
g1(6,6)=(-(params(1)/(1-params(1))*1/y(8)));
g1(6,8)=(-(params(1)/(1-params(1))*(-y(6))/(y(8)*y(8))));
g1(7,6)=(-(T(9)*T(6)*1/(1-params(1))*getPowerDeriv(y(6)/(1-params(1)),1-params(1),1)));
g1(7,8)=(-(T(8)*1/params(1)*getPowerDeriv(y(8)/params(1),params(1),1)));
g1(7,12)=1;
g1(7,18)=(-(T(9)*T(7)*(-1)/(y(18)*y(18))));
g1(8,12)=params(7)/y(16);
g1(8,16)=(-(y(12)*params(7)))/(y(16)*y(16));
g1(9,1)=(-(y(16)-y(12)));
g1(9,12)=y(1);
g1(9,14)=1;
g1(9,16)=(-y(1));
g1(10,1)=1;
g1(10,4)=(-1);
g1(10,5)=(-1);
g1(11,17)=1;
g1(12,18)=T(6)-T(6)*params(9);
g1(13,10)=1/params(16)-T(12)*y(19)*1/params(16)*getPowerDeriv(y(10)/params(16),params(13),1);
g1(13,17)=(-(T(11)*1/params(15)*getPowerDeriv(y(17)/params(15),params(14)*(1-params(13)),1)));
g1(13,19)=(-(T(10)*T(12)));
g1(14,19)=1/y(19)-params(10)*1/y(19);
g1(15,6)=T(13);
g1(15,7)=1;
g1(15,16)=(-((-y(6))/(y(16)*y(16))));
g1(16,8)=T(13);
g1(16,9)=1;
g1(16,16)=(-((-y(8))/(y(16)*y(16))));
g1(17,10)=T(13);
g1(17,11)=1;
g1(17,16)=(-((-y(10))/(y(16)*y(16))));
g1(18,14)=T(13);
g1(18,15)=1;
g1(18,16)=(-((-y(14))/(y(16)*y(16))));
g1(19,12)=T(13);
g1(19,13)=1;
g1(19,16)=(-((-y(12))/(y(16)*y(16))));

end

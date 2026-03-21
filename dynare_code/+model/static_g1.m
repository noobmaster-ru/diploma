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
    T = model.static_g1_tt(T, y, x, params);
end
g1 = zeros(10, 10);
g1(1,7)=(-params(2));
g1(2,2)=1-(1-params(3));
g1(2,5)=(-1);
g1(3,3)=T(2)*params(6)*getPowerDeriv(y(3),params(5),1);
g1(3,4)=T(1)*getPowerDeriv(y(4),params(4),1);
g1(3,6)=(-(1/y(8)));
g1(3,8)=(-((-y(6))/(y(8)*y(8))));
g1(4,1)=y(8)*(1-y(9));
g1(4,2)=y(7);
g1(4,3)=y(6);
g1(4,4)=(-y(8));
g1(4,5)=(-y(8));
g1(4,6)=y(3);
g1(4,7)=y(2);
g1(4,8)=y(1)*(1-y(9))-y(4)-y(5);
g1(4,9)=(-(y(8)*y(1)));
g1(5,1)=1;
g1(5,2)=(-(T(3)*y(10)*getPowerDeriv(y(2),params(1),1)));
g1(5,3)=(-(T(5)*getPowerDeriv(y(3),1-params(1),1)));
g1(5,10)=(-(T(3)*T(4)));
g1(6,2)=1/y(3);
g1(6,3)=(-y(2))/(y(3)*y(3));
g1(6,6)=(-(params(1)/(1-params(1))*1/y(7)));
g1(6,7)=(-(params(1)/(1-params(1))*(-y(6))/(y(7)*y(7))));
g1(7,6)=(-(T(7)*1/(1-params(1))*getPowerDeriv(y(6)/(1-params(1)),1-params(1),1)));
g1(7,7)=(-(T(6)*1/params(1)*getPowerDeriv(y(7)/params(1),params(1),1)));
g1(7,9)=1;
g1(8,8)=(-(y(9)*params(7)))/(y(8)*y(8));
g1(8,9)=params(7)/y(8);
g1(9,1)=1;
g1(9,4)=(-1);
g1(9,5)=(-1);
g1(10,10)=1/y(10)-params(9)*1/y(10);

end

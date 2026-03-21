function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = RBC_RPMP.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 31);
g1(1,9)=(-y(26))/(y(9)*y(9))*T(18);
g1(1,26)=T(18)*1/y(9);
g1(1,27)=(-(params(2)*1/y(28)));
g1(1,28)=(-(params(2)*(-y(27))/(y(28)*y(28))));
g1(2,9)=(-y(26))/(y(9)*y(9))*T(18);
g1(2,26)=T(18)*1/y(9);
g1(2,15)=(-(params(2)*1/y(29)));
g1(2,29)=(-(params(2)*(-y(15))/(y(29)*y(29))));
g1(3,1)=(-(1-params(3)));
g1(3,7)=1;
g1(3,10)=(-1);
g1(4,8)=T(3)*params(6)*getPowerDeriv(y(8),params(5),1);
g1(4,9)=T(2)*getPowerDeriv(y(9),params(4),1);
g1(4,11)=T(19);
g1(4,21)=(-((-y(11))/(y(21)*y(21))));
g1(5,6)=1;
g1(5,1)=(-(T(4)*y(23)*getPowerDeriv(y(1),params(1),1)));
g1(5,8)=(-(T(17)*getPowerDeriv(y(8),1-params(1),1)));
g1(5,23)=(-(T(4)*T(16)));
g1(6,1)=1/y(8);
g1(6,8)=(-y(1))/(y(8)*y(8));
g1(6,11)=(-(params(1)/(1-params(1))*1/y(13)));
g1(6,13)=(-(params(1)/(1-params(1))*(-y(11))/(y(13)*y(13))));
g1(7,11)=(-(T(7)*1/y(23)*1/(1-params(1))*getPowerDeriv(y(11)/(1-params(1)),1-params(1),1)));
g1(7,13)=(-(T(6)*1/params(1)*getPowerDeriv(y(13)/params(1),params(1),1)));
g1(7,17)=1;
g1(7,23)=(-(T(7)*T(5)*(-1)/(y(23)*y(23))));
g1(8,6)=T(11)*(-y(25))/(y(6)*y(6));
g1(8,25)=T(11)*1/y(6);
g1(8,17)=params(7)/y(21);
g1(8,3)=(-(params(8)*(T(8)-1)*T(20)+T(8)*params(8)*T(20)));
g1(8,21)=(-(y(17)*params(7)))/(y(21)*y(21))-(params(8)*(T(8)-1)*T(22)+T(8)*params(8)*T(22))+y(25)/y(6)*(T(10)*params(2)*params(8)*(-y(28))/(y(21)*y(21))+T(9)*(-y(28))/(y(21)*y(21))*2*y(28)/y(21));
g1(8,28)=y(25)/y(6)*(T(10)*params(2)*params(8)*1/y(21)+T(9)*1/y(21)*2*y(28)/y(21));
g1(9,6)=(-(y(21)-y(17)-y(21)*T(12)));
g1(9,17)=y(6);
g1(9,19)=1;
g1(9,3)=y(6)*y(21)*T(21);
g1(9,21)=(-(y(6)-y(6)*(T(12)+y(21)*T(23))));
g1(10,6)=1-T(12);
g1(10,9)=(-1);
g1(10,10)=(-1);
g1(10,3)=(-(y(6)*T(21)));
g1(10,21)=(-(y(6)*T(23)));
g1(11,3)=(-T(20));
g1(11,21)=(-T(22));
g1(11,22)=1;
g1(12,4)=(-(params(9)*1/y(4)));
g1(12,23)=1/y(23);
g1(12,30)=1;
g1(13,2)=(-(T(15)*y(24)*1/params(16)*getPowerDeriv(y(2)/params(16),params(13),1)));
g1(13,15)=1/params(16);
g1(13,29)=(-(T(14)*1/params(15)*getPowerDeriv(y(29)/params(15),params(14)*(1-params(13)),1)));
g1(13,24)=(-(T(13)*T(15)));
g1(14,5)=(-(params(10)*1/y(5)));
g1(14,24)=1/y(24);
g1(14,31)=1;
g1(15,11)=T(19);
g1(15,12)=1;
g1(15,21)=(-((-y(11))/(y(21)*y(21))));
g1(16,13)=T(19);
g1(16,14)=1;
g1(16,21)=(-((-y(13))/(y(21)*y(21))));
g1(17,15)=T(19);
g1(17,16)=1;
g1(17,21)=(-((-y(15))/(y(21)*y(21))));
g1(18,19)=T(19);
g1(18,20)=1;
g1(18,21)=(-((-y(19))/(y(21)*y(21))));
g1(19,17)=T(19);
g1(19,18)=1;
g1(19,21)=(-((-y(17))/(y(21)*y(21))));

end

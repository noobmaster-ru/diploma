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
    T = model.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 18);
g1(1,7)=T(18)*T(19);
g1(1,15)=T(19)*1/y(7);
g1(1,16)=(-(params(2)*y(17)/y(11)));
g1(1,11)=(-((-(params(2)*(1+y(16)-params(3))*y(17)))/(y(11)*y(11))));
g1(1,17)=(-(params(2)*(1+y(16)-params(3))/y(11)));
g1(2,1)=(-(1-params(3)));
g1(2,5)=1;
g1(2,8)=(-1);
g1(3,6)=T(2)*T(16);
g1(3,7)=T(1)*T(20);
g1(3,9)=(-T(21));
g1(3,11)=(-((-y(9))/(y(11)*y(11))));
g1(4,4)=y(11)*(1-y(12));
g1(4,1)=y(10);
g1(4,6)=y(9);
g1(4,7)=(-y(11));
g1(4,8)=(-y(11));
g1(4,9)=y(6);
g1(4,10)=y(1);
g1(4,11)=y(4)*(1-y(12))-y(7)-y(8);
g1(4,12)=(-(y(11)*y(4)));
g1(5,4)=1;
g1(5,1)=(-(T(3)*T(15)));
g1(5,6)=(-(T(13)*T(17)));
g1(5,13)=(-(T(3)*T(12)));
g1(6,1)=1/y(6);
g1(6,6)=(-y(1))/(y(6)*y(6));
g1(6,9)=(-(T(4)*1/y(10)));
g1(6,10)=(-(T(4)*(-y(9))/(y(10)*y(10))));
g1(7,9)=(-(T(6)*T(22)));
g1(7,10)=(-(T(5)*T(23)));
g1(7,12)=1;
g1(8,4)=T(10)*(-y(14))/(y(4)*y(4));
g1(8,14)=T(10)*1/y(4);
g1(8,2)=(-(params(8)*(T(7)-1)*T(24)+T(7)*params(8)*T(24)));
g1(8,11)=(-(y(12)*params(7)))/(y(11)*y(11))-(params(8)*(T(7)-1)*T(25)+T(7)*params(8)*T(25))+T(11)*T(29);
g1(8,17)=T(11)*T(31);
g1(8,12)=params(7)/y(11);
g1(9,4)=1;
g1(9,7)=(-1);
g1(9,8)=(-1);
g1(10,3)=(-(params(9)*1/y(3)));
g1(10,13)=1/y(13);
g1(10,18)=(-1);

end

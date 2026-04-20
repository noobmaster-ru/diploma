function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = RBC.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(41,1);
g2_j = zeros(41,1);
g2_v = zeros(41,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=3;
g2_i(6)=3;
g2_i(7)=3;
g2_i(8)=3;
g2_i(9)=4;
g2_i(10)=4;
g2_i(11)=4;
g2_i(12)=4;
g2_i(13)=4;
g2_i(14)=4;
g2_i(15)=4;
g2_i(16)=4;
g2_i(17)=5;
g2_i(18)=5;
g2_i(19)=5;
g2_i(20)=5;
g2_i(21)=6;
g2_i(22)=6;
g2_i(23)=6;
g2_i(24)=6;
g2_i(25)=8;
g2_i(26)=8;
g2_i(27)=8;
g2_i(28)=8;
g2_i(29)=9;
g2_i(30)=9;
g2_i(31)=9;
g2_i(32)=9;
g2_i(33)=9;
g2_i(34)=9;
g2_i(35)=9;
g2_i(36)=9;
g2_i(37)=9;
g2_i(38)=10;
g2_i(39)=10;
g2_i(40)=10;
g2_i(41)=10;
g2_j(1)=81;
g2_j(2)=88;
g2_j(3)=186;
g2_j(4)=193;
g2_j(5)=65;
g2_j(6)=66;
g2_j(7)=80;
g2_j(8)=81;
g2_j(9)=1;
g2_j(10)=5;
g2_j(11)=61;
g2_j(12)=12;
g2_j(13)=166;
g2_j(14)=65;
g2_j(15)=72;
g2_j(16)=170;
g2_j(17)=1;
g2_j(18)=5;
g2_j(19)=61;
g2_j(20)=65;
g2_j(21)=1;
g2_j(22)=5;
g2_j(23)=61;
g2_j(24)=65;
g2_j(25)=9;
g2_j(26)=121;
g2_j(27)=68;
g2_j(28)=110;
g2_j(29)=113;
g2_j(30)=114;
g2_j(31)=128;
g2_j(32)=117;
g2_j(33)=173;
g2_j(34)=129;
g2_j(35)=132;
g2_j(36)=174;
g2_j(37)=177;
g2_j(38)=17;
g2_j(39)=30;
g2_j(40)=212;
g2_j(41)=225;
g2_v(1)=T(17)*(-((-y(13))*(y(6)+y(6))))/(y(6)*y(6)*y(6)*y(6))+T(16)*T(16)*T(23);
g2_v(2)=T(17)*(-1)/(y(6)*y(6))+T(16)*1/y(6)*T(23);
g2_v(3)=g2_v(2);
g2_v(4)=1/y(6)*1/y(6)*T(23);
g2_v(5)=T(2)*params(6)*getPowerDeriv(y(5),params(5),2);
g2_v(6)=T(13)*T(18);
g2_v(7)=g2_v(6);
g2_v(8)=T(1)*getPowerDeriv(y(6),params(4),2);
g2_v(9)=(-(T(3)*y(12)*T(24)));
g2_v(10)=(-(y(12)*T(11)*T(14)));
g2_v(11)=g2_v(10);
g2_v(12)=(-(T(3)*T(11)));
g2_v(13)=g2_v(12);
g2_v(14)=(-(y(12)*T(9)*T(25)));
g2_v(15)=(-(T(9)*T(14)));
g2_v(16)=g2_v(15);
g2_v(17)=(-(T(3)*params(1)*getPowerDeriv(y(1),params(1)-1,2)));
g2_v(18)=(-(T(12)*T(14)));
g2_v(19)=g2_v(18);
g2_v(20)=(-(T(10)*T(25)));
g2_v(21)=(-(T(4)*(1-params(1))*T(24)));
g2_v(22)=(-((1-params(1))*T(11)*T(15)));
g2_v(23)=g2_v(22);
g2_v(24)=(-((1-params(1))*T(9)*getPowerDeriv(y(5),(-params(1)),2)));
g2_v(25)=1;
g2_v(26)=g2_v(25);
g2_v(27)=1;
g2_v(28)=g2_v(27);
g2_v(29)=(-(T(7)*1/y(12)*1/(1-params(1))*1/(1-params(1))*getPowerDeriv(y(8)/(1-params(1)),1-params(1),2)));
g2_v(30)=(-(T(20)*T(21)));
g2_v(31)=g2_v(30);
g2_v(32)=(-(T(7)*T(19)*(-1)/(y(12)*y(12))));
g2_v(33)=g2_v(32);
g2_v(34)=(-(T(6)*1/params(1)*1/params(1)*getPowerDeriv(y(9)/params(1),params(1),2)));
g2_v(35)=(-(T(21)*T(5)*(-1)/(y(12)*y(12))));
g2_v(36)=g2_v(35);
g2_v(37)=(-(T(7)*T(5)*(y(12)+y(12))/(y(12)*y(12)*y(12)*y(12))));
g2_v(38)=(-(exp(x(it_, 1))*getPowerDeriv(y(2),params(7),2)));
g2_v(39)=T(22);
g2_v(40)=g2_v(39);
g2_v(41)=(-T(8));
g2 = sparse(g2_i,g2_j,g2_v,10,225);
end

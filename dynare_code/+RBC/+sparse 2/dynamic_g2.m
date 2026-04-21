function [g2_v, T_order, T] = dynamic_g2(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(25, 1);
end
[T_order, T] = RBC.sparse.dynamic_g2_tt(y, x, params, steady_state, T_order, T);
g2_v = NaN(28, 1);
g2_v(1)=T(17)*(-((-y(24))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14))+T(16)*T(16)*T(23);
g2_v(2)=T(17)*(-1)/(y(14)*y(14))+T(16)*1/y(14)*T(23);
g2_v(3)=1/y(14)*1/y(14)*T(23);
g2_v(4)=T(2)*params(6)*getPowerDeriv(y(13),params(5),2);
g2_v(5)=T(13)*T(18);
g2_v(6)=T(1)*getPowerDeriv(y(14),params(4),2);
g2_v(7)=(-(T(3)*y(20)*T(24)));
g2_v(8)=(-(y(20)*T(11)*T(14)));
g2_v(9)=(-(T(3)*T(11)));
g2_v(10)=(-(y(20)*T(9)*T(25)));
g2_v(11)=(-(T(9)*T(14)));
g2_v(12)=(-(T(3)*params(1)*getPowerDeriv(y(2),params(1)-1,2)));
g2_v(13)=(-(T(12)*T(14)));
g2_v(14)=(-(T(10)*T(25)));
g2_v(15)=(-(T(4)*(1-params(1))*T(24)));
g2_v(16)=(-((1-params(1))*T(11)*T(15)));
g2_v(17)=(-((1-params(1))*T(9)*getPowerDeriv(y(13),(-params(1)),2)));
g2_v(18)=1;
g2_v(19)=1;
g2_v(20)=(-(T(7)*1/y(20)*1/(1-params(1))*1/(1-params(1))*getPowerDeriv(y(16)/(1-params(1)),1-params(1),2)));
g2_v(21)=(-(T(20)*T(21)));
g2_v(22)=(-(T(7)*T(19)*(-1)/(y(20)*y(20))));
g2_v(23)=(-(T(6)*1/params(1)*1/params(1)*getPowerDeriv(y(17)/params(1),params(1),2)));
g2_v(24)=(-(T(21)*T(5)*(-1)/(y(20)*y(20))));
g2_v(25)=(-(T(7)*T(5)*(y(20)+y(20))/(y(20)*y(20)*y(20)*y(20))));
g2_v(26)=(-(exp(x(1))*getPowerDeriv(y(10),params(7),2)));
g2_v(27)=T(22);
g2_v(28)=(-T(8));
end

function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = RBC.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(30, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=(-1);
g1_v(4)=1-(1-params(3));
g1_v(5)=(-(T(3)*y(10)*T(10)));
g1_v(6)=(-(T(3)*params(1)*getPowerDeriv(y(2),params(1)-1,1)));
g1_v(7)=(-(T(6)*(1-params(1))*T(10)));
g1_v(8)=y(7);
g1_v(9)=T(2)*params(6)*getPowerDeriv(y(3),params(5),1);
g1_v(10)=(-(y(10)*T(4)*T(11)));
g1_v(11)=(-(T(5)*T(11)));
g1_v(12)=(-((1-params(1))*T(4)*getPowerDeriv(y(3),(-params(1)),1)));
g1_v(13)=y(6);
g1_v(14)=T(1)*getPowerDeriv(y(4),params(4),1);
g1_v(15)=(-1);
g1_v(16)=(-1);
g1_v(17)=(-1);
g1_v(18)=(-1);
g1_v(19)=1;
g1_v(20)=y(3);
g1_v(21)=(-(T(9)*1/y(10)*1/(1-params(1))*getPowerDeriv(y(6)/(1-params(1)),1-params(1),1)));
g1_v(22)=(-params(2));
g1_v(23)=1;
g1_v(24)=y(2);
g1_v(25)=(-(T(8)*1/params(1)*getPowerDeriv(y(7)/params(1),params(1),1)));
g1_v(26)=1;
g1_v(27)=1;
g1_v(28)=(-(T(3)*T(4)));
g1_v(29)=(-(T(9)*T(7)*(-1)/(y(10)*y(10))));
g1_v(30)=1-exp(x(1))*getPowerDeriv(y(10),params(7),1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 10, 10);
end

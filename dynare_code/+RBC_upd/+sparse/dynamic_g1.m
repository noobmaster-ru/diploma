function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(21, 1);
end
[T_order, T] = RBC_upd.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(35, 1);
g1_v(1)=(-(1-params(3)));
g1_v(2)=(-(T(3)*y(20)*T(11)));
g1_v(3)=(-(T(3)*T(12)));
g1_v(4)=(-(T(4)*(1-params(1))*T(11)));
g1_v(5)=y(17);
g1_v(6)=(-(params(7)*1/y(10)));
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=1;
g1_v(11)=T(2)*T(13);
g1_v(12)=(-(y(20)*T(9)*T(14)));
g1_v(13)=(-(T(10)*T(14)));
g1_v(14)=(-((1-params(1))*T(9)*T(15)));
g1_v(15)=y(16);
g1_v(16)=T(16)*T(17);
g1_v(17)=T(1)*T(18);
g1_v(18)=(-1);
g1_v(19)=(-1);
g1_v(20)=(-1);
g1_v(21)=(-1);
g1_v(22)=1;
g1_v(23)=y(13);
g1_v(24)=(-(T(8)*T(20)));
g1_v(25)=1;
g1_v(26)=y(2);
g1_v(27)=(-(T(7)*T(21)));
g1_v(28)=1;
g1_v(29)=1;
g1_v(30)=(-(T(3)*T(9)));
g1_v(31)=(-(T(8)*T(6)*(-1)/(y(20)*y(20))));
g1_v(32)=T(5);
g1_v(33)=T(17)*1/y(14);
g1_v(34)=(-params(2));
g1_v(35)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 10, 31);
end

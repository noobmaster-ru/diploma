function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = tmp_search_model.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(45, 1);
g1_v(1)=(-(1-params(3)));
g1_v(2)=y(17);
g1_v(3)=(-(T(3)*y(20)*getPowerDeriv(y(2),params(1),1)));
g1_v(4)=1/y(13);
g1_v(5)=(-(params(8)*(T(6)-1)*(-y(18))/(y(8)*y(8))+T(6)*params(8)*(-y(18))/(y(8)*y(8))));
g1_v(6)=(-(params(9)*1/y(10)));
g1_v(7)=y(18)*(1-y(19));
g1_v(8)=1;
g1_v(9)=T(9)*(-y(21))/(y(11)*y(11));
g1_v(10)=y(18);
g1_v(11)=1;
g1_v(12)=T(2)*params(6)*getPowerDeriv(y(13),params(5),1);
g1_v(13)=y(16);
g1_v(14)=(-(T(11)*getPowerDeriv(y(13),1-params(1),1)));
g1_v(15)=(-y(2))/(y(13)*y(13));
g1_v(16)=(-y(24))/(y(14)*y(14))*T(12);
g1_v(17)=T(1)*getPowerDeriv(y(14),params(4),1);
g1_v(18)=(-y(18));
g1_v(19)=(-y(18));
g1_v(20)=(-1);
g1_v(21)=(-1);
g1_v(22)=(-1);
g1_v(23)=(-(1/y(18)));
g1_v(24)=y(13);
g1_v(25)=(-(params(1)/(1-params(1))*1/y(17)));
g1_v(26)=(-(T(5)*1/(1-params(1))*getPowerDeriv(y(16)/(1-params(1)),1-params(1),1)));
g1_v(27)=y(2);
g1_v(28)=(-(params(1)/(1-params(1))*(-y(16))/(y(17)*y(17))));
g1_v(29)=(-(T(4)*1/params(1)*getPowerDeriv(y(17)/params(1),params(1),1)));
g1_v(30)=(-((-(params(2)*(1+y(27)-params(3))*y(28)))/(y(18)*y(18))));
g1_v(31)=(-((-y(16))/(y(18)*y(18))));
g1_v(32)=y(11)*(1-y(19))-y(14);
g1_v(33)=(-(y(19)*params(7)))/(y(18)*y(18))-(params(8)*(T(6)-1)*1/y(8)+T(6)*params(8)*1/y(8))+y(21)/y(11)*(T(8)*params(2)*params(8)*(-y(28))/(y(18)*y(18))+T(7)*(-y(28))/(y(18)*y(18))*2*y(28)/y(18));
g1_v(34)=y(11)-y(14);
g1_v(35)=(-(y(18)*y(11)));
g1_v(36)=1;
g1_v(37)=params(7)/y(18);
g1_v(38)=(-(T(3)*T(10)));
g1_v(39)=1/y(20);
g1_v(40)=T(9)*1/y(11);
g1_v(41)=T(12)*1/y(14);
g1_v(42)=(-(params(2)*y(28)/y(18)));
g1_v(43)=(-(params(2)*(1+y(27)-params(3))/y(18)));
g1_v(44)=y(21)/y(11)*(T(8)*params(2)*params(8)*1/y(18)+T(7)*1/y(18)*2*y(28)/y(18));
g1_v(45)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 10, 31);
end

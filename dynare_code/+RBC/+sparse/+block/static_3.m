function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  T(2)=params(6)*y(3)^params(5);
  T(3)=y(4)^params(4);
  residual(1)=(T(2)*T(3)-y(6)/y(8))-(0);
  residual(2)=(y(8)*y(1)*(1-y(9))+y(3)*y(6)+y(7)*y(2)-y(4)*y(8)-y(8)*y(5))-(0);
  T(4)=y(3)^(1-params(1));
  T(5)=y(10)*y(2)^params(1);
  residual(3)=(y(1)-T(4)*T(5))-(0);
  residual(4)=(y(2)/y(3)-y(6)/y(7)*params(1)/(1-params(1)))-(0);
  T(6)=(y(7)/params(1))^params(1);
  residual(5)=(y(9)-(y(6)/(1-params(1)))^(1-params(1))*T(6))-(0);
  residual(6)=(1-params(7)+y(9)*params(7)/y(8))-(0);
  residual(7)=(y(1)-y(4)-y(5))-(0);
  residual(8)=(y(2)-y(2)*(1-params(3))-y(5))-(0);
if nargout > 3
    g1_v = NaN(27, 1);
g1_v(1)=(-(1/y(8)));
g1_v(2)=y(3);
g1_v(3)=(-(params(1)/(1-params(1))*1/y(7)));
g1_v(4)=(-(T(6)*1/(1-params(1))*getPowerDeriv(y(6)/(1-params(1)),1-params(1),1)));
g1_v(5)=y(8)*(1-y(9));
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=y(7);
g1_v(9)=(-(T(4)*y(10)*getPowerDeriv(y(2),params(1),1)));
g1_v(10)=1/y(3);
g1_v(11)=1-(1-params(3));
g1_v(12)=T(3)*params(6)*getPowerDeriv(y(3),params(5),1);
g1_v(13)=y(6);
g1_v(14)=(-(T(5)*getPowerDeriv(y(3),1-params(1),1)));
g1_v(15)=(-y(2))/(y(3)*y(3));
g1_v(16)=(-(y(8)*y(1)));
g1_v(17)=1;
g1_v(18)=params(7)/y(8);
g1_v(19)=(-((-y(6))/(y(8)*y(8))));
g1_v(20)=y(1)*(1-y(9))-y(4)-y(5);
g1_v(21)=(-(y(9)*params(7)))/(y(8)*y(8));
g1_v(22)=T(2)*getPowerDeriv(y(4),params(4),1);
g1_v(23)=(-y(8));
g1_v(24)=(-1);
g1_v(25)=(-y(8));
g1_v(26)=(-1);
g1_v(27)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
end

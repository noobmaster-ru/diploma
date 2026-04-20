function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  T(2)=params(6)*y(13)^params(5);
  T(3)=y(14)^params(4);
  residual(1)=(T(2)*T(3)-y(16))-(0);
  T(4)=y(13)^(1-params(1));
  T(5)=y(2)^params(1);
  residual(2)=(y(11)-T(4)*y(20)*T(5))-(0);
  T(6)=y(13)^(-params(1));
  residual(3)=(y(16))-(T(6)*(1-params(1))*T(5));
  residual(4)=(y(11)-y(14)-y(15))-(0);
  residual(5)=(y(12)-(1-params(3))*y(2)-y(15))-(0);
  T(7)=params(1)*y(2)^(params(1)-1);
  residual(6)=(y(17))-(T(4)*T(7));
  residual(7)=((y(24)/y(14))^params(4)-params(2)*(1+y(27)-params(3)))-(0);
  T(8)=getPowerDeriv(y(2),params(1),1);
  T(9)=getPowerDeriv(y(13),1-params(1),1);
  T(10)=getPowerDeriv(y(24)/y(14),params(4),1);
if nargout > 3
    g1_v = NaN(21, 1);
g1_v(1)=(-(T(4)*y(20)*T(8)));
g1_v(2)=(-(T(6)*(1-params(1))*T(8)));
g1_v(3)=(-(1-params(3)));
g1_v(4)=(-(T(4)*params(1)*getPowerDeriv(y(2),params(1)-1,1)));
g1_v(5)=T(3)*params(6)*getPowerDeriv(y(13),params(5),1);
g1_v(6)=(-(y(20)*T(5)*T(9)));
g1_v(7)=(-((1-params(1))*T(5)*getPowerDeriv(y(13),(-params(1)),1)));
g1_v(8)=(-(T(7)*T(9)));
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=(-1);
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=(-1);
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=T(2)*getPowerDeriv(y(14),params(4),1);
g1_v(18)=(-1);
g1_v(19)=(-y(24))/(y(14)*y(14))*T(10);
g1_v(20)=(-params(2));
g1_v(21)=T(10)*1/y(14);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end

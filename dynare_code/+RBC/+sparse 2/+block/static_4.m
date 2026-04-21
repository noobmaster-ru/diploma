function [y, T] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(9)=1/y(10)*(y(6)/(1-params(1)))^(1-params(1))*(y(7)/params(1))^params(1);
  y(8)=y(1)-y(7)*y(2)-y(3)*y(6);
end

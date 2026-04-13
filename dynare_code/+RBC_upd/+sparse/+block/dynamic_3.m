function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(19)=1/y(20)*(y(16)/(1-params(1)))^(1-params(1))*(y(17)/params(1))^params(1);
  y(18)=y(11)-y(17)*y(2)-y(13)*y(16);
end

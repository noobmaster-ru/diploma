function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 9
    T = [T; NaN(9 - size(T, 1), 1)];
end
T(1) = params(6)*y(3)^params(5);
T(2) = y(4)^params(4);
T(3) = y(3)^(1-params(1));
T(4) = y(2)^params(1);
T(5) = params(1)*y(2)^(params(1)-1);
T(6) = y(3)^(-params(1));
T(7) = (y(6)/(1-params(1)))^(1-params(1));
T(8) = 1/y(10)*T(7);
T(9) = (y(7)/params(1))^params(1);
end

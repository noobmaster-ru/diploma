function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(1) = params(6)*y(3)^params(5);
T(2) = y(4)^params(4);
T(3) = y(3)^(1-params(1));
T(4) = y(2)^params(1);
T(5) = y(18)*T(4);
T(6) = 1/y(18);
T(7) = (y(6)/(1-params(1)))^(1-params(1));
T(8) = T(6)*T(7);
T(9) = (y(8)/params(1))^params(1);
T(10) = (y(10)/params(16))^params(13);
T(11) = y(19)*T(10);
T(12) = (y(17)/params(15))^(params(14)*(1-params(13)));
end

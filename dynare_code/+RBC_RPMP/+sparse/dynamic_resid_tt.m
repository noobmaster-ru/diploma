function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 17
    T = [T; NaN(17 - size(T, 1), 1)];
end
T(1) = (y(42)/y(23))^params(4);
T(2) = params(6)*y(22)^params(5);
T(3) = y(23)^params(4);
T(4) = y(22)^(1-params(1));
T(5) = (y(25)/(1-params(1)))^(1-params(1));
T(6) = 1/y(37)*T(5);
T(7) = (y(27)/params(1))^params(1);
T(8) = y(35)/y(16);
T(9) = params(2)*params(8)*(y(54)/y(35)-1);
T(10) = (y(54)/y(35))^2;
T(11) = T(9)*T(10);
T(12) = params(8)/2*(T(8)-1)^2;
T(13) = (y(10)/params(16))^params(13);
T(14) = y(38)*T(13);
T(15) = (y(55)/params(15))^(params(14)*(1-params(13)));
T(16) = y(2)^params(1);
T(17) = y(37)*T(16);
end

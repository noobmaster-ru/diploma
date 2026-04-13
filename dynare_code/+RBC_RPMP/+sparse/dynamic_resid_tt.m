function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 23
    T = [T; NaN(23 - size(T, 1), 1)];
end
T(1) = (y(42)/y(23))^params(4);
T(2) = params(6)*y(22)^params(5);
T(3) = y(23)^params(4);
T(4) = y(22)^(1-params(1));
T(5) = params(1)/(1-params(1));
T(6) = 1/y(37);
T(7) = (y(25)/(1-params(1)))^(1-params(1));
T(8) = T(6)*T(7);
T(9) = (y(27)/params(1))^params(1);
T(10) = y(35)/y(16);
T(11) = params(2)*params(8)*(y(54)/y(35)-1);
T(12) = (y(54)/y(35))^2;
T(13) = T(11)*T(12);
T(14) = y(39)/y(20);
T(15) = params(8)/2;
T(16) = T(15)*(T(10)-1)^2;
T(17) = y(35)*T(16);
T(18) = params(6)/2;
T(19) = (y(10)/params(16))^params(13);
T(20) = y(38)*T(19);
T(21) = (y(55)/params(15))^(params(14)*(1-params(13)));
T(22) = y(2)^params(1);
T(23) = y(37)*T(22);
end

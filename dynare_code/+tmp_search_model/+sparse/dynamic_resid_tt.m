function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(1) = params(6)*y(13)^params(5);
T(2) = y(14)^params(4);
T(3) = y(13)^(1-params(1));
T(4) = (y(16)/(1-params(1)))^(1-params(1));
T(5) = (y(17)/params(1))^params(1);
T(6) = y(18)/y(8);
T(7) = params(2)*params(8)*(y(28)/y(18)-1);
T(8) = (y(28)/y(18))^2;
T(9) = T(7)*T(8);
T(10) = y(2)^params(1);
T(11) = y(20)*T(10);
end

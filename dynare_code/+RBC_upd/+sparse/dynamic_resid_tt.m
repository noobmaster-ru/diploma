function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(1) = params(6)*y(13)^params(5);
T(2) = y(14)^params(4);
T(3) = y(13)^(1-params(1));
T(4) = y(13)^(-params(1));
T(5) = 1/y(20);
T(6) = (y(16)/(1-params(1)))^(1-params(1));
T(7) = T(5)*T(6);
T(8) = (y(17)/params(1))^params(1);
T(9) = y(2)^params(1);
T(10) = params(1)*y(2)^(params(1)-1);
end

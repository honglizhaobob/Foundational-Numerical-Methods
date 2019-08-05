function [y, yp] = function_10(x,p)
y = atan(x - 0.111);
yp = 1 / (1 + (x-0.111)^2);
end
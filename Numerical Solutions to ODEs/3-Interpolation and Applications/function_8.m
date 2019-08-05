function [y, yp] = function_8(x,p)
y = (1/x) + log(x) - 2;
yp = (-1/x^2) + (1/x);
end
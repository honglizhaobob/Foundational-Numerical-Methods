function y_p = p2fun(t,y,r)
% This is the function with free parameters L in problem 2
% used as a function handle for euler
global L
L=100000; % change for each test

y_p = -L*(y-cos(30*t))-30*sin(30*t);
return
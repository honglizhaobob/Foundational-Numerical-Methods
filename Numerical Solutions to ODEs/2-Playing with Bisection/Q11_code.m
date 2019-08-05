% call bisection with arguments
% we test t = 10^-10, bisecting the interval [-1,2]
[approx_root, history] = bisection(-1,2,@(x,p)((x-0.111)^3),10,10^-5);

% begin calculating the error
exact = 0.111;
abs_e = abs(approx_root - exact);
rel_e = abs_e / exact;
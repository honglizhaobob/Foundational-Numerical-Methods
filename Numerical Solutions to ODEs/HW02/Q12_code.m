% call bisection with arguments
% we test t = 10^-10, bisecting the interval [-1,2]
[approx_root, history] = bisection(-1,2,@(x,p)(atan(x-0.111) ),10,10^-10);

final_r = approx_root;
exact = 0.111;
abs_e = abs(final_r - exact);
rel_e = abs_e / exact;
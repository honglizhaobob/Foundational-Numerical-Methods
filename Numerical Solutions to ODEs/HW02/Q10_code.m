% call bisection with arguments
% we let t = 10^-5, bisecting the interval [4,8]
[approx_root, history] = bisection(4,8,@(x,p)((1/x) + log(x) - 2),10,10^-5);
exact_r1 = 6.305;
exact_r2 = 0.318;

abs_e1 = abs(exact_r1 - approx_root);
rel_e1 = abs_e1 / exact_r1;
% another root
[approx_root2, history2] = bisection(0.1,1,@(x,p)((1/x) + log(x) - 2),10,10^-5);
abs_e2 = abs(exact_r2 - approx_root2);
rel_e2 = abs_e2 / exact_r2;
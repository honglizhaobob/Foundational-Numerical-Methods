% In Q9b, we are essentially solving for the zero such that
% x - 2sin(x) = 0. Therefore, we let f(x) = x - 2sin(x) so that we can use
% the function handle later in the arguments of bisection()
% as per the question, we pass in t = 10 ^ -5, p is arbitrary as it is not
% used, f is the function we defined above, and interval a and b

% because we want a positive root, we choose interval [1,2]

% here we call bisection
[approximated_root, history] = bisection(1,2,@(x,p)(x - 2*sin(x)),10,10^-5);
% by observing the graph
exact_root = 1.895;
abs_error = abs(exact_root - approximated_root);
rel_error = abs_error / exact_root;




% more explanations...

% In the command window, we see that after executing the code, the
% approximated root is exactly 0 because we have chosen a tolerance of
% 10^-5 which is significantly greater than realmin, therefore only five
% digits were retained. 

% For such a small interval as [-1,1], the bisection efficiently only took
% 1 step (this could also be explained by a round-off tolerance of 10^-5).
% The reason is that the correct answer x = 0 is approximated by realmin as
% bisection shrinks. Right after the first loop (refer to the third elseif
% in bisection.m, m was assigned to 0. And as the answer is exactly 0, the
% f(m) == 0 is triggered and m output without any further operations).

% Once the function finds out that the correct root is between (-x, x)
% (with arbitrary x), it jumps to m=0 immediately, significantly reducing
% the amount of looping

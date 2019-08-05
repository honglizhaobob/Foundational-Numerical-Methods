function [mean_error, CPU_time] = iteration(R)
% This displays a table, and only tracks the CPU_time
% Obtains wi+1 by functional iteration, starting with w0, w1, w2
% at each step, use wi as a kick start to approximate wi+1

% - tol: user-specified tolerance
tic
format long
W=zeros(1,21); % initialize vector W, exact
exact = W;
h=0.01; T=0:h:0.2; e=exp(1);
W(1)=1; W(2)=p1_y(T(2)); W(3)=p1_y(T(3));
for i=1:21
    exact(i)=p1_y(T(i));
end

for i=4:21
    rep=0;
    W(i)=W(i-1); % kickstart iteration with Wi-1 -> Wi

    while rep<R
        % iterative: 20 times
        W(i)=W(i-1)+(h/24)*(9*e^(W(i))+19*e^W(i-1)-5*e^W(i-2)+e^(W(i-3)));
        rep=rep+1;
        % updated W(i) 20 times
    end
end        

mean_error=mean(abs(exact-W));
CPU_time = toc;
end
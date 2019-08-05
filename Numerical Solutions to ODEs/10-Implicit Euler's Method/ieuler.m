function Error = ieuler(a,b,ya,f,r,n)
% Adopts implicit euler's method
% This algorithm uses Newton's iteration to approximate un+1 at each step
% we obtain our very first approximation using explicit euler, then correct
% by using iteration
% un+1 = un+hf(un)
format long
global L

h=(b-a)/n; y=zeros(1,n+1);
t=a:h:b; e=exp(1);
y(1)=ya;
prev_error = 0;

for i=1:n
    y(i+1)=y(i);% kickstart iteration by one euler
    % use the old value as a predictor
    % and correct with one implicit euler step
    % Because the problem is linear,
%    y(i+1) = y(i)+h*f(t(i+1), y(i+1), r);
% In this case, we have:
%               y' = f(t,y) = -L(y-phi)+phi_prime
% with the method, at each i
%              F(y) = y - y(i)-hf(y) = (1+hL)*y -yi -h(L*phi+phi_prime)
%              F'(y)= 1+hL
    
    rep=0;

    while rep < 1
        % we use 2 newton iterations
        F=(1+h*L)*y(i+1)-y(i)-h*( L*cos(30*t(i+1))-30* sin(30*t(i+1)) );
        F_p=1+h*L;
        y(i+1)=y(i+1)-F/F_p;
        % updated newton 20 times
        rep=rep+1;
    end 

    exact=cos(30*t(i))+e^(-L*t(i)); % calculate exact as we go
    % update error everytime, use if
    % This is a makeshift way of getting the max global error
    curr_error = abs(exact-y(i));
    if curr_error > prev_error
        Error = curr_error;
    end
    prev_error = curr_error;
end
% Output: Max global error, compare with exact solution calculated in (a)

% generate plot
plot(t,y)
title("Line Plot for: " + num2str(n) + " steps and L = " + num2str(L)); xlabel('Position x');
ylabel('Position y');
return
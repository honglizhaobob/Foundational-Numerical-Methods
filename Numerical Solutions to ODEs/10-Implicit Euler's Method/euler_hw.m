function Error = euler_hw(a,b,ya,f,r,n)

format long
% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector y(b)
%**********
%** modified for PS11, p2
% want h = 10e-j using j=1,2,...6, we alter n to reflect this
%**********
global L
% Should be able to use L for both functions

h=(b-a)/n; 
y=zeros(length(ya),n);

t=a:h:b; % time interval with stp sze h
e = exp(1);

y(:,1)=ya(:); % general vector initialization

prev_error = 0;
for i=1:n
    y(:,i+1)=y(:,i)+ h*f(t(i),y(:,i),r);
    exact=cos(30*t(i))+e^(-L*t(i)); % calculate exact as we go
    % update error everytime, use if
    % This is a makeshift way of getting the max error
    curr_error = abs(exact-y(i));
    if curr_error > prev_error
        Error = curr_error;
    end
    prev_error = curr_error;
end
% Output: Max global error, compare with exact solution calculated in (a)

% generate plot
plot(t,y)
title("Line Plot for: " + num2str(n) + " steps"); xlabel('Position x');
ylabel('Position y');
return
function y = euler_vp3c(a,b,ya,f,r,n)
format long
%---- modified some features of the original function to fit for p3(c)'s
%purpose
% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector y(b)

% this function also does the plotting

h=(b-a)/n; 
y=zeros(length(ya),n);

T=a:h:b; % time interval with stp sze h
y(:,1)=ya(:); % general vector initialization

for i=1:n
    y(:,i+1)=y(:,i)+ h*f(T(i),y(:,i),r); % builds the i+1th col
end 

%output all the approximations
% this function also does the plotting
plot(T,y); xlabel('Time t'); ylabel('Function Value y'); grid on
title("Graph of y(t) by Euler Method using: " + num2str(n) + " Steps")

return
function [E,T,u] = euler_hw(a,b,ya,f,r,n)

format long
% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector y(b)

%added for convenience:
% T: CPU runtime
% E: Error estimate
% this function also does the plotting

tic % used to meausure cpu time

h=(b-a)/n; 
y=zeros(length(ya),n);

T=a:h:b; % time interval with stp sze h

y(:,1)=ya(:); % general vector initialization
%disp(y)
for i=1:n
    y(:,i+1)=y(:,i)+ h*f(T(i),y(:,i),r); % builds the i+1th col
end

%output the last approximation to y(b)
u=y(:,n+1);% [x_b, y_b, u_b, v_b], is the last column
E=max([abs(u(1)-cos(b)), abs(u(2)-sin(b)), abs(u(3)+sin(b)), abs(u(4)-cos(b))]);
% generate plot
X=y(1,:); Y=y(2,:);
plot(X,Y)
title("Line Plot for: " + num2str(n) + " steps"); xlabel('Position x');
ylabel('Position y');
T=toc;

return
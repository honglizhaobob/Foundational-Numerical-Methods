function [T,E,u_T] = euler_vp4(a,b,ya,f,r,n)

% --- version p4 - modified euler function for prob4

% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector f(T)

%added for convenience:
% T: CPU runtime
% E: Error estimate
%****
% ya=[0.994,0,0,-2.00158510637908],b=T=17.06521656015796
%****
tic % used to meausure cpu time

h=(b-a)/n; 
% we cannot create a matrix anymore since for extremely large N, program is
% slow

T=a:h:b; % time interval with stp sze h
u_T=ya'; % u_T starts from ya, build up
for i=1:n
    u_T=u_T+ h*f(T(i),u_T,r); % builds next u_T col
end
%output the last approximation to u(T)
% [x_T, x'_T, y_T, v'_T], is the last column approximation at T

% for E: we can just compare start position and end position, since it is
% an orbit. We compute norm value of the difference of [u1,u2,u3,u4] at a and b
E=norm(u_T-ya);
T=toc;
return
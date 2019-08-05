function [ CPUtime, e, t, u ] = pcode_hw(a, b, ua, f, r, k, N)
% a,b: interval endpoints with a < b
% ua: vector u_1 = y(a) of initial conditions
% f: function handle f(t, u, r) to integrate
% r: parameters to f
% k: number of previous steps to use at each regular time step
% N: total number of time steps,
% t: output times for numerical solution u_n ~ y(t_n), t(1) = a, t(N) = b
% u: numerical solution at times t
   

% added features -- 
% e - max error
% CPU time
tic
h = (b-a)/(N-1); h1 = (b-a)*(h/(b-a))^(k/2);
u(:,1) = ua; t(1) = a; t(N) = b;

for k1 = 1:k
    t(k1+1) = t(k1) + h1;
    [p,q] = pcoeff(t,k1,k1);
    u1 = 0;
    for i = 1:k1
        u1 = u1 + f(t(i),u(:,i),r)*p(length(p)-i+1);
    end
    u(:,k1+1) = 0;
    for i = 2:k1
        u(:,k1+1) = u(:,k1+1) + f(t(i),u(:,i),r)*q(length(q)-i+2);
    end
    u(:,k1+1) = u(:,k1+1)+ u(:,k1) + f(t(k1+1),u1,r)*q(1);
        
% want to continuously update h
if h1 < h
    h1 = (1+1/k)*h1;
end
end

for i = (k+1):N
    if h1 < h
        h1 = (1+1/k)*h1;
    end
    if t(i)+ 0.05*N*h1 > b % predict if going to exceed b
        h1 = (b-t(i))/(N-i+1);
    end
    t(i+1) = t(i) + h1;
    if h1 ~= mean(t((i-k+1):i))
    [p,q] = pcoeff(t,i,k); % uniform, store p,q
    end
    u1 = 0;
    for j = 1:k
        u1 = u1 + f(t(i-k+j),u(:,i-k+j),r)*p(length(p)-j+1);
    end
    u1 = u1 + u(:,i);
    u(:,i+1) = u1;
    u(:,i+1) = 0;
    if k ~=1
        for j = 1:k-1
            u(:,i+1) = u(:,i+1) + f(t(i-k+j+1),u(:,i-k+j+1),r)*q(length(q)-j+1);
        end
    end
    u(:,i+1) =  u(:,i) + (f(t(i+1),u1,r)*q(1)+u(:,i+1));
    
end

% ----Below are added features
uT = u(:, end); e = max(uT-ua');
%Time to do the plotting
x=u(1,:); y=u(3,:);
plot(x,y); title("NUMERICAL APPROXIMATION TO ORBIT");
CPUtime = toc;
end

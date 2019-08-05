function T = idec(a, b, ya, f,  r, p, n)
% a,b: interval endpoints with a < b
% ya: vector y(a) of initial conditions
% f: function handle f(t, y) to integrate (y is a vector)
% r: parameters to f
% p: number of euler substeps / correction passes
% n: number of time steps
% yb: output approximation to the final solution vector y(b)

%modified for (b)- only return CPU time
tic
u=[];
u(:,1) = ya;
h = (b-a)/(n*p);
t = a:h:(a+p*h);
e=[];
% perform uncorrected
for k = 1:n
    for j = 2:p+1
        u(:,(k-1)*p+j) = u(:,(k-1)*p+j-1) + h*f(t(j-1),u(:,(k-1)*p+j-1),r);
    end

% build correction, using interpolation in each variable
% repeat p-1 times correction
    for q = 1:(p-1)
        e(:,(k-1)*p+1) = [0,0,0,0]';
        for j = 2:p+1
            v(1) = forn_matrix(1,t(j-1),t)*u(1,((k-1)*p+1):((k-1)*p+p+1))';
            v(2) = forn_matrix(1,t(j-1),t)*u(2,((k-1)*p+1):((k-1)*p+p+1))';
            v(3) = forn_matrix(1,t(j-1),t)*u(3,((k-1)*p+1):((k-1)*p+p+1))';
            v(4) = forn_matrix(1,t(j-1),t)*u(4,((k-1)*p+1):((k-1)*p+p+1))';
            e(:,(k-1)*p+j) = e(:,(k-1)*p+j-1)+ h*f(t(j-1),u(:,(k-1)*p+j-1)+e(:,(k-1)*p+j-1),r) -h*v';
        end

        u(:,(k-1)*p+1:(k-1)*p+1+p) = u(:,(k-1)*p+1:(k-1)*p+1+p) + e(:,(k-1)*p+1:(k-1)*p+1+p);
     end

t = t(end):h:(t(end)+p*h);
end
%create a history matrix, with yb being the last column
H =u(:,:);

yb=H(:,end);

T=toc;

end
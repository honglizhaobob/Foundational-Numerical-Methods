function [p, q] = pcoeff( t, n, k )
% t: solution times t(1) < t(2) < ... < t(n) < t( n+1 )
% n+1: new time step
% k: number of previous steps t(n-k+1)..t(n)

p=zeros(1,k); q=zeros(1,k); % initialize two vectors to record p and q
% To find pj, we intergrate from tn->tn+1 a (k-1) degree polynomial, we
% find the polynomial first
index = n-k+1:n; % index i
np = ceil(k/2); % number of points for Gaussian integration
% row vector that contains all gauss weights, and legendre nodes
[w, gauss_t] = gaussint(np); 

% do change of var
gauss_t = ((t(n+1)-t(n))/2)*gauss_t+((t(n+1)+t(n))/2);
P=zeros(1,np);% initialize a vector to hold all results from gauss_t -> polynomial
for j = n-k+1:n % (j is k points indices)
    % use Gaussint to integrate this polynomial
    % hint: ceil(k/2) is enough number of points
    for x=1:np    
        copy = index;
        copy(copy==j)=[]; % indicates i ~= j
        % initialize a polynomial to build the integrand
        poly = 1;
        for i = copy
            poly=poly * ( gauss_t(x) - t(i))/(t(j)-t(i));
        end
        P(x)=((t(n+1)-t(n))/2)*poly;
    end

    % to compute pj, simply vector multiply w*P
    pj = dot(w,P);
    p(j+k-n)=pj;
end
% implementation of q is the same, except n-k+2<=j<=n+1
index2=n-k+2:n+1; Q=zeros(1,np);
for j=n-k+2:n+1
    for x=1:np
        copy2=index2;
        copy2(copy2==j)=[];
        
        poly2=1;
        for i = copy2
            
            poly2=poly2*(gauss_t(x)-t(i))/(t(j)-t(i));
        end
        Q(x)=((t(n+1)-t(n))/2)*poly2;
    end
    
    qj=dot(w,Q);
    q(j+k-n-1)=qj;
end

end

    
    









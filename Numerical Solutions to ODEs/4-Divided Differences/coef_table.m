function [delta_we_want,Table] = coef_table(a,X,Fx,N,M)
% a - where to evaluate the coefficients
% X - n+1 points, with xn the point we currently look at being the first
% Fx - values evaluated at these points, should be also n+1
% N - the number of points we want to loop through
% M - the order of the derivatives we loop through
T=zeros(N,M); %T is preallocated to store these coefficients
T(1,1)=Fx(1); % the first row is always Fk and a bunch of zeros

% initializing the first column involves a bit more work, basically, we are
% not differentiating (m=0), and this is just the Lagrange polynomials
% the formula is rather simple: we just evaluate at a using 1 point, 2
% points, ..., n+1 points
first_column=zeros(N,1); % hold the column
for k=1:N
    first_column(k,1)=lagrange(a,X(1:k),Fx(1:k));
end
    
T(:,1)=first_column; % then allocate
% now that we have initialized delta base cases, lets define the recursion
for k=2:N
    for m=2:M
        T(k,m)=T(k-1,m-1)*(1/(X(1)-X(k))) + T(k-1,m)*(a-X(k))/(X(1)-X(k));
    end
end
Table=T;

%resulting a n by m matrix, the delta we are computing is entry N,M
delta_we_want=T(N,:);
end

% notice, that this method computes a delta(k,m) for a specific xn we look
% at
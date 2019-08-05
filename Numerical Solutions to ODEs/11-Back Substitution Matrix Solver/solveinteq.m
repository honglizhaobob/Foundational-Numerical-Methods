function [Error, t, u] = solveinteq( a, b, kernel, rhs, p, n )
% a, b: endpoints of interval
% kernel: function handle for kernel K = kernel( t, s ) of integral equation
% rhs: function handle for right-hand side f = rhs( t, p ) of integral equation
% p: parameters for rhs
% n: number of quadrature points and weights
% t: evaluation points in [a,b]
% u: solution values at evaluation points
format long
[gw, t]=gaussint(n);
% - gw: gauss weights
% - t: evaluation points (need change of interval)
t=((b-a)/2)*t + (b+a)/2; % changed evaluation points

aug = zeros(1,length(t));
for i=1:length(t)
    aug(i) = rhs(t(i), p);
end

% Create the augmented matrix and solve it
M = nan(n, n+1); M(:,end) = aug;
for i=1:n
    for j=1:n
        M(i,j) = ((b-a)/2) * kernel(t(i),t(j))*gw(j);
    end
end
I = eye(n); I(:,end+1)=0;
M = M+I;
% now we can solve M (should be in the form Ku = f)

K=M(:,1:end-1); % the square matrix
norm_K=norm(K,1); % compute norm with square matrix

for i=1:n
    [maximum,kmax]=max(abs(M(i:n,i)));
    kmax=kmax+i-1;
    if maximum < (1e-14)*norm_K
        error('No solution / Infinite solutions')
    end
    if i~=kmax
        h=M(kmax,:); M(kmax,:)=M(i,:); M(i,:)=h; % interchange row
    end
    M(i+1:n,i)=M(i+1:n,i)/M(i,i); % elimination step
    M(i+1:n,i+1:n+1)=M(i+1:n,i+1:n+1)-M(i+1:n,i)*M(i,i+1:n+1);
end
u=back_sub(M,M(:,n+1));
y_exact = @(t) cos(p*t);
exact=y_exact(t);
Error = max(abs(exact-u'));
end

function x=back_sub(U,b)
% U - upper triangular
% b - rhs
n=length(b);
for k=n:-1:1
    s=b(k);
    for j=k+1:n
        s=s-U(k,j)*x(j);
    end
    x(k)=s/U(k,k);
end
x=x(:);
end
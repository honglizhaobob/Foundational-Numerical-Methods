function [Deltas] = diff_coeffs(n,M,a,x)
d_start=zeros(n+1,M+1);
Deltas=d_start;
d_start(1,1)=1;

for k=1:n+1
    d=d_start;
    xx=x;
    xx([1 k])=xx([k 1]);
    for m=2:M+1
        for nn=2:n+1
             d(nn,m) = (d(nn-1,m-1)*m + d(nn-1,m)*(a-x(n)))/(x(1)-x(nn));
        end
    end
    Deltas(k,:)=d(n+1,:);
end
end
             
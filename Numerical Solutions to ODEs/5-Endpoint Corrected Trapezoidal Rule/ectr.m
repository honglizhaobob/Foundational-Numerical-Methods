function W = ectr(n,k)
% n : quadrature points are 0 ... n
% k: degree of precision
W=1:n+1; 
W(1)=W(1)*(1/2);
W(n+1)=W(n+1)*(1/2);
m=(k+2)/2;
B=calc_bm(10);

X=0:n;
for j=1:n+1
    SUM=0;
    for M=1:2:m
        for i=1:n+1
            I=( diff_coeffs(i,M,n,X) - diff_coeffs(i,M,0,X) );
            I(:,1)=[];
            W=I;
%           SUM=SUM+B(i)*I(1,1);
        end
    end
%    W(j)=W(j)+SUM;
end
end
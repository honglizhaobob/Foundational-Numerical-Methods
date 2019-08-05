function val = pleg(t,n)
%t: evaluation point
%n: degree of polynomial
p=zeros(n+1);
p(1)=1;
p(2)=t;
for m=2:n
    c=((m-1)^2)/(4*(m-1)^2-1);
    p(m+1)=t*p(m)-c*p(m-1);
end
val=p(n+1);
end
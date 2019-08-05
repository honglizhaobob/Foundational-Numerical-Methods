function Bm = calc_bm(m)
% calculate bm given m >= 0, using the recurrence relation, b0=0
b1=(1/factorial(3))-(1/2)*(1/2); % we need to calculate b1 by hand
B=[b1]; % initialize a vector to store all the b's
for i=2:m
    sum=0;
    for j=1:i-1
        sum=sum+(B(j)/factorial( (2*i-1) - 2*(j-1) ) );
    end
    B(i)=(1/factorial(2*i+1))-(1/2)*(1/factorial(2*i))-sum;
end
Bm=B;
end
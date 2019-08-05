function [count_eval, int, abt] = gadap(a, b, f, r, tol)
% a,b: interval endpoints with a < b
% f: function handle f(x, r) to integrate
% r: parameters for f
% tol: User-provided tolerance for integral accuracy
% int: Approximation to the integral
% abt: Endpoints and approximations

%(b) added arg: count_calls, every iteration (evaluation of an integral),
%we have 3 additional function evaulations because we used a 3pnt rule

weights = [5/9,8/9,5/9]; % 3 point gaussian weights
roots = [-sqrt(3/5),0,sqrt(3/5)];
count_eval=0; % initialize count_eval

% 1- compute whole integral
int = 0; %initialize int
coef =(b-a)/2;
cnst =(a+b)/2;


for i=1:3
    int=int+weights(i)*f(coef*roots(i)+cnst,r); %change of variables
end
count_eval=count_eval+3;
int=coef*int; %adjust for interval

n = 1;
abt(1,1) = a;
abt(2,1) = b;
abt(3,1) = int;
j = 0;
int = 0;
while( j < n )
j=j+1;
% subdivide [a,b]
a_left = abt(1, j);
b_right = abt(2, j);
whole_int = abt(3, j);
mid =(a_left+b_right)/2;
a_right = mid;

%----compute left integral [a,mid]
cnst = (a_left+mid)/2;
coef = (mid-a_left)/2; % again, change of variable
left_int = 0; % similar manner to computing whole int
for i = 1:3
    left_int=left_int + weights(i) * f(coef * roots(i)+cnst, r );
end
count_eval=count_eval+3;
left_int = coef * left_int;
%----compute left integral [mid,b]
cnst = (a_right+b_right)/2;
coef = (b_right-a_right)/2;
right_int = 0.0;
for i = 1:3
     right_int=right_int + weights(i) * f(coef*roots(i)+cnst, r );
end
count_eval=count_eval+3;
right_int = coef*right_int;
%---> compare, avoid infinite loop
if abs(whole_int-left_int-right_int) > tol * max(abs(whole_int),abs(left_int)+abs(right_int))
    % if error exceeds tolerance, we continue subdividing
    n=n+1;
    abt(1,n) = a_left;
    abt(2,n) = mid;
    abt(3,n)=left_int;

    abt(1,n+1)=a_right;
    abt(2,n+1)=b_right;
    abt(3,n+1)=right_int;
else % else output int
    int=int+whole_int;
end

end
end
    
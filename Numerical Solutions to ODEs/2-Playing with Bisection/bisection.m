function [r, h] = bisection(a, b, f, p, t)
% set up
% check if input a,b are good for bisection
format long
if (sign (f(a,p)) == sign(f(b,p))) % do not multiply fa and fb lest overflow
    error('f(a) and f(b) have the same sign, bad interval')
end

h = []; % initialize empty matrix h

while ( (b-a) > t * min(abs(a), abs(b)) ) 
% iterate loop until error is sufficiently small
% compute m with several conditions
if a == 0
    m = realmin;
elseif b == 0
    m = -realmin;
elseif (a<0) && (b>0)
    m = 0;
else
    m = sign(a) * sqrt(abs(a)) * sqrt(abs(b));
end

one_column = [a;b;f(m)]; % includes one column of history
    h = [h, one_column];
% check if m gives f(m) = 0, if so, return m
    if f(m) == 0
        r = m;
        return
    end
    
% check if realmin is reached (namely when m = a or m = b), if so, return m
    if (m == a) || (m == b)
        r = m;
        return
    end
    if ( sign(f(m,p)) == sign(f(a,p)) )
% update [a,b] after each iteration
% if f(a) and f(m) have the same sign, we use the other half of the interval
        a = m;
    else
        b = m;
    end
end
r = m; % best approximation to root after looping
return
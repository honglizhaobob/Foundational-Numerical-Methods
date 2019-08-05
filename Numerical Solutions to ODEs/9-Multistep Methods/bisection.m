function [r, h] = bisection(a, b, f, p, t)
% a: Beginning of interval [a, b]
% b: End of interval [a, b]
% f: function handle y = f(x, p)
% p: parameters to pass through to f
% t: User-provided tolerance for interval width

    h = [];
    
    while 1
        m = middle(a, b);
        fa = f(a, p);
        fb = f(b, p);
        fm = f(m, p);
        
        % Record step, terminate if f vanishes
        if fa == 0
            r = a;
            h = [h, [a; b; fm]];
            break
        elseif fb == 0
            r = b;
            h = [h, [a; b; fm]];
            break
        else
            r = m;
            h = [h, [a; b; fm]];
        end
        
        % Terminate if b - a is small
        if (b - a <= t * min(abs(a), abs(b)) || a == m || b == m)
            break
        end
                
        % Bisect otherwise
        if sign(fa) ~= sign(fm)
            b = m;
        else
            a = m;
        end
    end

end

function m = middle(a, b)

    % Find the midpoint m
    if a == 0
        m = realmin;
    elseif b == 0
        m = -realmin;
    elseif sign(a) ~= sign(b)
        m = 0;
    else
        m = sign(a) * sqrt(abs(a)) * sqrt(abs(b));
    end
    
end
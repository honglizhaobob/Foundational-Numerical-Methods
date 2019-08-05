function r = newton(x0, f, p, n)
% x0: initial estimate of the root
% f: function and derivative handle [ y, yp ] = f(x, p)
% p: parameters to pass through to f
% n: number of steps

% implement functions in a separate file, we need to compute derivative
% manually
iter = 1;
while iter <= n
    % call function f on x0, p to get [y,yp]
    [y, yp] = f(x0,p);
% call expression returns two values, y and yp (as f(x0) and f'(x0)
    x = x0 - y / yp;
% calculate number of correct bits, analyze relative error
    rel_error = abs(x0-x)/abs(x0);
    good_bits = floor(-log2(rel_error));
%    fprintf('[Step %d] \n  ', iter);
 %   fprintf('%d correct bits \n', good_bits);
    disp(x0)
    iter = iter+1;
% update x0 = x
% after n iterations, we have a most updated x0, bind it to the root as
% our approximation
    x0 = x;
    
end
r = x0;
return
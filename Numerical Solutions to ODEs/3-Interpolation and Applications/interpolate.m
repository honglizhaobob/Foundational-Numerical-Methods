function coeffs = interpolate(n, points, f)
% this function finds the coefficients for the interpolated polynomial
% 3 args, n - how many points, points - actual implementation of n points (handle),
% f - function handle pointing to original_function

% in order to find the coefficients, we need to find the data points
X = points(n);
Y = f(X);
coeffs = polyfit(X,Y,n-1);
end
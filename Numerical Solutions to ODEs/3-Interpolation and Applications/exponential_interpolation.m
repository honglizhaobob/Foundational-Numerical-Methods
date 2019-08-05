function coeffs = exponential_interpolation(n)
% this is 5(d) exponential interpolation problem
% points are equidistantly distributed, and original function is 1/1+t^6

k = 0:1:n;
interpolants = 0:5/n:5; % create n points to interpolate
f_x = @(x) 1 ./ (1+x.^6);
data_at_interpolants = f_x(interpolants); % calculate actual data at interpolants
% we solve for an n+1 x n+1 matrix to compute the coefficients
for i = 1:1:n+1
    for j = 1:1:n+1
        A(i,j) = exp(1) ^ ((-(j-1)/n)*i/n);
    end
end
data = data_at_interpolants';
coeffs = data \ A; % matrix computation, solve for coeffs

end
        
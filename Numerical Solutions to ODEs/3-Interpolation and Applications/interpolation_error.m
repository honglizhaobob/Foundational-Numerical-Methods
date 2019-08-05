function E = interpolation_error(X, P)
% X - a vector that contains all points we want to compare
% P - the coeffcient vector after interpolation
% compute E = f(X) - p(X)
FX = original_function(X); % exact f(x)
PX = polyval(P, X);
E = max(FX - PX); % this returns the maximum error
end
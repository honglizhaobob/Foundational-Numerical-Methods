% this function creates a range of chebyshev points
function points = cheby_points(n)
k = 0:1:n; % k are integers, runs from 0 to n
points = (5+5*cos((2*k+1)*pi/(2*n+2)))/2;
end
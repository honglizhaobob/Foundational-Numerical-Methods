% this function creates a range of geometrically distributed points
function points = geo_points(n)
points = []; % store the points
for j=0:1:n
    points = [points, geo_recursion(j)];
end
    
end
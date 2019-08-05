% geo_recursion is a helper function that helps compute the j-th geometric
% point, recursively
function pnt = geo_recursion(j)
if j == 0
    pnt = 0;
    return;
end
if j == 1
    pnt = 5;
    return;
end
pnt = (geo_recursion(j-1)+geo_recursion(j-2))/2;
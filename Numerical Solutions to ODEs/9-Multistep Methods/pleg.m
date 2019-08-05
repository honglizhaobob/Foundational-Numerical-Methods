function p = pleg(t, n)
% t: evaluation point
% n: degree of polynomial
  assert(n>=0, 'n < 0 not defined');
  resu = zeros(n+1,1);
  resu(1) = 1;
  resu(2) = t;
  for i = 3:n+1
    c = (i-2)^2 / (4*(i-2)^2 - 1);
    resu(i) = t * resu(i-1) - c*resu(i-2);
  end
  p = resu(n+1);
end

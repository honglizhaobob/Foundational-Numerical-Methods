function val = evaluate_gaussint(n,f)
% automatically computes evaluation by using gaussint(n) and multiplying
% sum and weights (applying f on each root)
[W, R]=gaussint(n);
f_n=zeros(1,n); % preallocate vector
for i=1:n
    f_n(i)=f(R(i)); %evaluate at each root
end
val = f_n*W';
end
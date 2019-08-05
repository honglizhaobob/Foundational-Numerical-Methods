function y = p1_y(t)
% this is the function we are trying to approximate in p(1)
e=exp(1);
y=1-log(1-e*t);
end
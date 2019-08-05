function Y=prob3_circle(t,z,r)
% this is a function mainly used as a function handle in euler that models
% the circle
% z is a vector - [x y u v]
x=z(1);
y=z(2);
u=z(3);
v=z(4);

Y=[u;v;(-x)/(x^2+y^2);(-y)/(x^2+y^2)];
end
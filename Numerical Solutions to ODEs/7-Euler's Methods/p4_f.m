function U = p4_f(t,u,r)
% this function is the representation of u'=[u1,u2,u3,u4]'=[x',x'',y',y'']
% u - vector [u1,u2,u3,u4] we pass in
a=0.012277471; b=1-a;
u1=u(1); u2=u(2); u3=u(3); u4=u(4);
U=[u2,...
u1+2*u4-b*((u1+a)/((u1+a)^2+u3^2)^(3/2))-((a*(u1-b))/((u1-b)^2+u3^2)^(3/2)),...
u4,...
u3-2*u2-b*(u3/((u1+a)^2+u3^2)^(3/2))-((a*u3)/((u1-b)^2+u3^2)^(3/2))];
U=U';
% U = [u1', u2', u3', u4']
end
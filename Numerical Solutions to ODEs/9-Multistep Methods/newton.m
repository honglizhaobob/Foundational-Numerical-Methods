function [mean_error,CPU_time] = newton(R)
% Keeps track of CPU time and returns it
format long
W=zeros(1,21);
exact = W;
h=0.01; T=0:h:0.2; e=exp(1);
W(1)=1; W(2)=p1_y(T(2)); W(3)=p1_y(T(3));
% our rule is 
% g(w) = wi + h/24 (9e^w + 19e^wi - 5e^wi-1 + e^wi-2)
% at each step, wi, wi-1, wi-2 are constants
% g'(w) = 3h/8 * e^w
% wi = wi - f(wi)/f'(wi)

for i=1:21
    exact(i)=p1_y(T(i));
end

for i=4:21
    rep=0;
    W(i)=W(i-1); % kick start iteration

    while rep < R
        f = W(i)-W(i-1)-(h/24)*(9*e^W(i)+19*e^W(i-1)-5*e^W(i-2)+e^W(i-3));
        f_p = 1-((9*h)/24) * e^W(i); 
        W(i) = W(i)-f/f_p;
        % updated Newton 20 times
       
        rep=rep+1;
  
    end
end
mean_error=mean(abs(exact-W));
CPU_time = toc;
end
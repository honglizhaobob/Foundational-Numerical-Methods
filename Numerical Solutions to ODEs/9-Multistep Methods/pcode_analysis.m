function [ C_s, CPUtime, Errors ]=pcode_analysis()
% This function analyzes pcode_hw.m
K = 1:2:9; Ns = [10000,20000,40000,80000,160000];
a=0; b=17.06521656015796; ua=[0.994,0,0,-2.00158510637908];

Errors = zeros(5,5);
CPUtime = Errors; % hold all errors and time at each pair of conditions
h=(b-a)./(Ns-1); h=h';% this results in a 1x5 vector of h's used for regression
C_s=zeros(1,5); % hold all the estimated constants
for k=1:5
    for i=1:5
        [time, e]=pcode_hw(a,b,ua,@p4_f,0,K(k),Ns(i));
        CPUtime(i,k)=time;
        Errors(i,k)=e;     
    end
end

for col=1:5
    C_s(col)=(h.^K(col))\Errors(:,col);
end

end

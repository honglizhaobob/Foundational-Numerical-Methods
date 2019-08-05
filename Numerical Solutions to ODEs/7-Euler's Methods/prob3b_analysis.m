function [C, errors, CPUt] = prob3b_analysis(low, high, incre)
format long
% -- this function is specifically used for testing/analyzing euler_hw
% low/high: lowest/highest number of steps to test
% incre: increment each for loop
%--- Outputs:
% C - constant such that error=C*h
% errors - error measures for each run: as a vector
% CPUt - CPU time for each run: as a vector

% A - a multi-dimensional array that stores
% ... [E T u] results for each number of steps
% then we work with A to output the 2x16 data matrices we want
% ... matrx of step size and CPU time
% ... matrx of step size and Error
% of the form A=[Error, CPUt]
A=cell(1,((high-low)/incre)+1);
for step=low:incre:high
    [t1,t2]=euler_hw(0,4*pi,[1,0,0,1],@prob3_circle,0,step);
    A{step/incre}=[t1,t2];
end
% we simply isolate the data into two forms:
% (1)[ CPU time vs steps ]  and  (2) [ Error vs steps ]
% we use (2) first because it is more easily interpreted
error_hs=zeros(2,length(A));
steps=low:incre:high;
h=(4*pi) ./ steps; % calculate hs
for i=1:length(A)
    error_hs(1,i)=A{1,i}(1); % take the errors
    error_hs(2,i)=h(i);
end
% we run linear regression to get the coefficient
% such that gives rise to the form: Error=C*h
errors=(error_hs(1,:)'); h=(error_hs(2,:)');

C = h\errors; % so Error = C * h roughly, we thus have C


% now we find some relationship between CPUt and Error

% have h = Error/C
% ... we can try to find B such that CPUt = B*h
% ... then CPUt/B = Error/C, we have Error = A * CPUt, where A=C/B
% ... linear regression on [CPUt, h]

CPUt=zeros(1,length(A));
for i=1:length(A)
    CPUt(i)=A{1,i}(2);
end
CPUt=CPUt'; % we have the CPUt
% run regression: get B := CPUt = B*h
B = h\CPUt;
% then we have A:
A = C/B;
% now, we have Error = A * CPUt, we can calculate CPUt's given Error
accuracy=[10^-3, 10^-6, 10^-12]; % the Errors

% Estimate CPUt
est_CPUt = A./accuracy;  %corresponds [10e-3,10e-6,10e-12]
Accuracy=accuracy'; Estimated_CPU_Time=est_CPUt';
T=table(Accuracy, Estimated_CPU_Time); disp(T)

end
    
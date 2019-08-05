function p4b_analysis()
% This is a function that runs euler_vp4 multiple times, solves and organizes solutions of P4(b) into
% separate tables. This function also plots the relationship between Error
% and N. And also, displays the table that contains
%    Digit Accuracy             CPUt Necessary
% --------------------      ---------------------

% U_T: matrix 4xlength(1000:1000:1024000), all of the approximated u(T), for each different N
% Errors: vector, used for plotting
% CPUt: vector, all CPU times
T=17.06521656015796; ya=[0.994,0,0,-2.00158510637908];
N=1000:1000:1024000; % all step numbers, a 1x1024 vector
% (1) approximate U_T, use N=1024000 (the most accurate step)
[T_maxN,E_maxN,U_T]=euler_vp4(0,T,ya,@p4_f,0,N(1024));
at_T=["x","x prime","y","y_prime"]'; Tbl=table(at_T,U_T); disp(Tbl)

% (2)Measure CPU tme for each run - and use linear regression against Errors to
% get a constant C such that Errors = C  *  CPUtime
CPUt=zeros(1,length(N));
Errors=zeros(1,length(N));
for index=1:length(N)
    [e,t,u]=euler_vp4(0,T,ya,@p4_f,0,N(index));
    Errors(index)=e; % vector, holds all errors
    CPUt(index)=t;% vector, holds all CPU times
end
CPU_Time_at_N=CPUt'; Step_Sizes=N'; C=CPUt\Errors;
test_cput=[10^-3,10^-6,10^-12]'; est_time=C*test_cput;
table_Error_CPUt=table(test_cput,est_time); disp(table_Error_CPUt);
table_CPUt_N=table(Step_Sizes,CPU_Time_at_N); disp(table_CPUt_N);
% (3) Plot Error vs N - shows an inverse relationship
grid on
title('Plot of Error vs N'); xlabel('N step size'); ylabel('Error(N)');
plot(N,Errors);
end
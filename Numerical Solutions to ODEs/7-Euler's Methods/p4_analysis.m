function p4_analysis()
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

e=0;
grid on
title('Plot of Errors vs N'); xlabel('N Size'); ylabel('Error(N)');
for i=1:length(N)
    hold on
    e=euler_vp4(0,T,ya,@p4_f,0,N(i));
    plot(N(i),e,'-o');
end
hold off
%grid on
%title('Plot of CPU runtime vs N'); xlabel('N step size'); ylabel('CPU time(N)');
%for i=1:length(N)
%    hold on
%    Time=euler_vp4(0,T,ya,@p4_f,0,N(i));
%    plot(N(i),Time,'-o');
%end
%hold off
%plot(N,Errors);
end
function E = idec_analysis()
% (a)- Analyze error, put into a table form, use linear regression to
% approximate Cp

% this function prints out the matrix that contains all the errors
% the rows: 10000,...,80000 number of steps used
% the columns: 1-7 orders

% The C is chose with p=7, and approximatly E=C7*h^7 for any h
% we are going to proceed with this C for (b)
% see p4b_time_analysis
a=0; b=17.06521656015796; ya=[0.994,0,0,-2.00158510637908];
N=[10000,20000,40000,80000]; order=1:7;

Error_vector=zeros(4,1); % 4x1 has all errors: stepsize x order_fixed

for ord=1:7
    
    for i=1:4
        y=idec(a,b,ya,@p4_f,0,ord,N(i));
        Error_vector(i,ord)=max([abs(y(1)-0.994),abs(y(2)),abs(y(3)),abs(y(4)+2.00158510637908)]);
    end
end
disp(Error_vector); %for each order, display a table 4x7
% For the C, we use and verify the highest order of accuracy, which is p=7
% we use regression to calculate a C7 such that E7N=C7*h^7
H=b./(7*N); Hp=H.^7;Hp=Hp'; C=Error_vector(:,7)\Hp;
disp(C);

end
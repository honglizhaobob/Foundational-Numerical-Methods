function idec_time()
% (b)- Analyze CPU time, put into a table form

% this function prints out the matrix that contains all the errors
% the rows: 10000,...,80000 number of steps used
% the columns: 1-7 orders

% see p4b_time_analysis
a=0; b=17.06521656015796; ya=[0.994,0,0,-2.00158510637908];
N=[10000,20000,40000,80000]; order=1:7;

time_vector=zeros(4,1); % 4x1 has all errors: stepsize x order_fixed

for ord=1:7
    
    for i=1:4
        time_vector(i,ord)=idec(a,b,ya,@p4_f,0,ord,N(i));
    end
end
disp(time_vector); %for each order, display a table 4x7

end
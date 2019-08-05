function [w, t] = gaussint( n )

%(a) Find all the roots
% n: Number of Gauss weights and points
root_table=zeros(n+2);
root_table(:,1)=-1; %make left most -1

for e=1:n+2
    root_table(e,e)=1; %make diagonal 1
end
%------we have preallocated table to store all roots
for i=3:n+1 %inspect the matrix starting row 3 -> P1, to row n+2 -> Pn (n+2 row built by n+1)
    for j=1:i-1
        bstart=root_table(i,j); %bisection's a
        bend=root_table(i,j+1);% bisection's b
        root=bisection(bstart,bend,@pleg,i-1,10^-10);
        root_table(i+1,j+1)=root;
    end
end
last_row=root_table(n+2,:);
t=last_row(2:n+1);
%(b) Find all the weights
% change of variable (t+1)/2 -> u
u=(t+1)./2;
% we define the Lagrange polynomial
alphas=ectr(10,11); %good accuracy, use later
alphas=alphas'; %SUM * alphas
w=zeros(1,n);
nodes=0:0.1:1;
for index=1:length(u)
    copy=u;
    copy(index)=[];
    for node=nodes
        L=1/2;
        L_s=zeros(1,length(nodes));
        for j=1:length(copy)
            L=L*( ( node-copy(j)) / ( (u(index)-copy(j)) ) );
        end
        L_s(j)=L;
    end
    w(index)=dot(L_s,alphas);
end
end
        
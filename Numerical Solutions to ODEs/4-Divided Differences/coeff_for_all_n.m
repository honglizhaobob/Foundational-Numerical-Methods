% in this module, we calculate the matrix of delta's with 
% -- rows: different xn's we are looking at
% -- columns: delta for different m's at this n
function delta_table = coeff_for_all_n(a,X,Fx,N,M)

delta_table=zeros(N,M);
for i=1:N
    copy_X=X; % we don't want to make permenant changes to X, create a copy each loop
    copy_Fx=Fx;
    
    copy_X([1,i])=copy_X([i,1]); % always make the point we are looking at the first
    copy_Fx([1,i])=copy_Fx([i,1]);
    
    delta_row=coef_table(a,copy_X,copy_Fx,N,M);
    delta_table(i,:)=delta_row;
end

end
    
    


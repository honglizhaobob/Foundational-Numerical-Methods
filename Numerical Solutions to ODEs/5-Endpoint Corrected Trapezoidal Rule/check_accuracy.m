function A = check_accuracy(h)
% notice that the weights, theoretically, need to add up to n
% but since our method has used the differentiation approximation, we can
% check the absolute accumulated error by comparing with n

% we write a for loop to do exactly that, for each k we pass in
% A should result in a vector with all the errors
% for simplicity, we use n=20
A=zeros(1,5); % preallocate vector
for i=2:2:10
    A(1,i/2)=abs(sum(ectr_with_h(20,i,h)) - 20);
end

end
    

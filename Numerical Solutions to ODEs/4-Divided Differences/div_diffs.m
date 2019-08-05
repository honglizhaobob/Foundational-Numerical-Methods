function [diffs, M] = div_diffs(xs, fs, f_ps)
% account for the derivatives as well

% this is a function that computes divided differences and the matrix for
% computing the differences
n = length(xs) - 1;
M=zeros(n+1);
for i=1:n+1
    M(i,1)=fs(i);
    for j=1:i-1
        if xs(i)==xs(i-j)
            M(i,j+1) = f_ps(i);
        else
            M(i,j+1)=(M(i,j)-M(i-1,j))/(xs(i)-xs(i-j));
        end
    end
end

diffs=diag(M);
end

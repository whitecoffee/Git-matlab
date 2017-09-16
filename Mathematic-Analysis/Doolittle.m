function [L,U] = Doolittle( A )
%直接三角分解A,A为方阵
%       A=LU
[row,col] = size(A);
L = eye(row,col);
U = zeros(row,col);
n = row;
for j=1:1:n
    U(1,j) = A(1,j);
end
for i=2:1:n
    L(i,1) = A(i,1)/U(1,1);
end

% 先计算U的一行，再计算L的一列，不能一次性计算完U
for k=2:1:n
    for j=k:1:n
        sum = 0;
        for m=1:1:k-1
            sum = sum + L(k,m)*U(m,j);
        end
        U(k,j) = A(k,j) - sum;
        
        i = j+1;
        if i<=n
            sum = 0;
            for m=1:1:k-1
                sum = sum + L(i,m)*U(m,k);
            end
            L(i,k) = (A(i,k) - sum)/U(k,k);
        end
    end
end
end


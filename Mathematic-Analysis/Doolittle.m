function [L,U,y,x] = Doolittle( A,b )
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

y = zeros(n,1);
x = zeros(n,1);
y(1) = b(1);
for i=2:n
    sum = 0;
    for j=1:i-1
        sum = sum + L(i,j)*y(j);
    end
    y(i) = b(i) - sum;
end

x(n) = y(n)/U(n,n);
for i=n-1:-1:1
        sum = 0;
    for j=i+1:n
        sum = sum + U(i,j)*x(j);
    end
    x(i) = (y(i) - sum)/U(i,i);
end
end


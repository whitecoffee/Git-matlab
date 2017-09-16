function [T,M,x] = Crout( A,b )
%	用克劳特分解(追赶法)解三对角矩阵
%   A = LDM L为单位下三角矩阵，D为对角矩阵，M为单位上三角矩阵
%   Ax=b A的顺序主子式均不为零
%   令T=LD，T为下三角矩阵
[row,col] = size(A);
n = row;
T = zeros(row,col);
M = eye(row,col);

T(1,1) = A(1,1);
M(1,2) = A(1,2)/A(1,1);
for i=2:n
    T(i,i-1) = A(i,i-1);
end
for i=2:n
    T(i,i) = A(i,i) - A(i,i-1)*M(i-1,i);
    if i~=n
        M(i,i+1) = A(i,i+1)/T(i,i);
    end
end
y = zeros(n,1);
x = zeros(n,1);
y(1) = b(1)/T(1,1);
for i=2:n
    y(i) = (b(i)-A(i,i-1)*y(i-1)) / T(i,i);
end
x(n) = y(n);
for i=n-1:-1:1
    x(i) = y(i) - M(i,i+1)*x(i+1);
end
end


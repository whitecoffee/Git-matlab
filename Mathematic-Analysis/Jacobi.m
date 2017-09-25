function [ B,f,x,iter ] = Jacobi( A,b,x_per )
%   用雅柯比迭代法(J迭代法)对方程组求近似解
%   Ax=b => Bx+f=x
m = size(A,1);
B = zeros(m,m);
f = zeros(m,1);
for i=1:m
    for j=1:m
        B(i,j) = -A(i,j)/A(i,i);
    end
    B(i,i) = 0;
    f(i) = b(i)/A(i,i);
end

iter = 0;
x = zeros(m,1);
x_k = ones(m,1);
while (abs(x-x_k) > 0.0001)
    iter = iter+1;
    x_k = x;
    x = B*x + f
end

end


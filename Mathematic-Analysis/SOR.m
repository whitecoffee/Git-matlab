function [ B,f,x,iter ] = SOR( A,b,x_per,omega )
%使用逐次超松驰迭代法求解方程组近似解
%   Ax=b => Bx+f=x
m = size(A,1);
B = zeros(m,m);
f = zeros(m,1);

for i=1:m
    delta = omega/A(i,i);
    for j=1:m
        B(i,j) = -delta*A(i,j);
    end
    B(i,i) = 0;
    f(i) = delta*b(i);
end

iter = 0;
x = zeros(m,1);
while (abs(x-x_per) > 0.0001)
    iter = iter+1;
    for i=1:m
        x(i) = B(i,:)*x + f(i);
    end
end

end


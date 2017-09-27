function [ B,f,x,iter ] = Gauss_Seidel( A,b,x_per )
%ʹ�ø�˹-���¶��������󷽳�����ƽ�
%   Ax=b => Bx+f=x
%   x_perΪ��ȷ��
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
while (abs(x-x_k) > 0.001)
    iter = iter+1;
    x_k = x;
    for i=1:m
        x(i) = B(i,:)*x + f(i);
    end
end

end


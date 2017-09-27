function [x,iter] = SOR( A,b,omega,N,Epsilon)
%ʹ����γ��ɳ۵�������ⷽ������ƽ�
n = size(A,1);
x = zeros(n,1);
for iter=1:N
    R = zeros(n,1);
    for i=1:n
        R(i) = omega*(b(i)-sum(A(i,:)*x))/A(i,i);
        x(i) = x(i)+R(i);
    end
    if max(abs(R))<= Epsilon
        break;
    end
end
end


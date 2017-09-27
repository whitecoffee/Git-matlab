b = 3;
k = 1/2;
n = 10;
x = zeros(n,1);
for i=1:n-1
x(i+1) = b-k*x(i);
end
t = linspace(1,n,n);
plot(t,x');
hold on;
plot(t,x','k+');
axis([0 n+1 -5 5]);
title('����k^n������0ʱ��ʹ�õ�������x���ƽ�','FontSize',16);
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
title('对于k^n趋近于0时，使用迭代法求x近似解','FontSize',16);
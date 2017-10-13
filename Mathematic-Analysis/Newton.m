% f = 0;
syms x
x0 = 0.5;
phi = x*exp(x) - 1;
phi1 = diff(phi);
epsilon = 1e-05;
N = 10;
x = x0;
for k=0:N
    f = eval(phi);
    f1 = eval(phi1);
    alpha = x-f/f1;
    if abs(alpha - x) < epsilon
        fprintf('\n x�������%d, ��������%d \n',alpha,k);
        break;
    end
    x = alpha;
    if k==N
        disp('����ʧ��');
    end
end




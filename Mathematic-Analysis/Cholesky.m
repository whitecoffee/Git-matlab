function [G,y,x] = Cholesky( A,b )
% function [L,D,x] = Cholesky( A,b )
% 将对称正定阵用乔列斯基分解法进行分解
%   A一定为对称的正定矩阵 Ax = b
[row,col] = size(A);
n = row;

% 普通的平方法
G = zeros(row,col);
for k=1:n
    sum = 0;
    for m=1:k-1
        sum = G(k,m)^2 + sum;
    end
    G(k,k) = sqrt(A(k,k) - sum);
    for i=k+1:n
        sum = 0;
        for m=1:k-1
            sum = G(i,m)*G(k,m) + sum;
        end
        G(i,k) = (A(i,k) - sum)/G(k,k);
    end
end
y = zeros(row,1);
x = zeros(row,1);
for k=1:n
    sum = 0;
    for m=1:k-1
        sum = G(k,m)*y(m) + sum;
    end
    y(k) = (b(k) - sum)/G(k,k)
end
for k=n:-1:1
    sum = 0;
    for m=k+1:n
        sum = G(m,k)*x(m) + sum;
    end
    x(k) = (y(k) - sum)/G(k,k);
end

% 改进的平方法，A=LDL'
% D = zeros(row,1);   %实质上D为对角阵，这里只计算其对角元素
% L = eye(row,col);
% for k=1:n
%     sum = 0;
%     for m =1:k-1
%         sum = sum + L(k,m)^2*D(m);
%     end
%     D(k) = A(k,k) - sum;
%     for i=k+1:n
%         sum = 0;
%         for m =1:k-1
%             sum = sum + L(i,m)*D(m)*L(k,m);
%         end
%         L(i,k) = (A(i,k) - sum)/D(k);
%     end
% end
% y = zeros(row,1);
% x = zeros(row,1);
% for k=1:n
%     sum = 0;
%     for m=1:k-1
%         sum = sum + L(k,m)*y(m);
%     end
%     y(k) = b(k) - sum;
% end
% for k=n:-1:1
%     sum = 0;
%     for m=k+1:n
%         sum = sum + L(m,k)*x(m);
%     end
%     x(k) = y(k)/D(k) - sum;
% end

end


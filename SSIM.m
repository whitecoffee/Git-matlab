function result = SSIM( X,Y )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
C1 = 0.0001;
C2 = 0.0001;
% C3 = 0.0001;

[row,col] = size(X);
N = row*col;
meanx = mean(mean(X));
meany = mean(mean(Y));

deviationx = sqrt( sum(sum((X-meanx).^2))/(N-1) );
deviationy = sqrt( sum(sum((Y-meany).^2))/(N-1) );
% deviationxy = mean(mean((X-meanx).*(Y-meany)));

L = (2*meanx*meany + C1)/(meanx^2 + meany^2 + C1);
C = (2*deviationx*deviationy + C2 )/(deviationx^2 + deviationy^2 + C2);
% S = (deviationxy + C3) / (deviationy*deviationy + C3);

result = L*C;

end


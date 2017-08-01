function newImg = normalize( srImg, row, col )
%输入图像srImg,行row，列col，SR系统参数a,b用于输出错误信息
%   将输入的图像灰度值平均分布在[0,1]的区间内

%归一均化处理
Pixmax = max(max(srImg));   
Pixmin = min(min(srImg));
Pixdelta = Pixmax - Pixmin;
srImg1 = zeros(row, col);
for i=1:row
    for j=1:col
        srImg1(i, j) = (srImg(i, j) - Pixmin)/Pixdelta;
    end
end

%计算灰度值大概范围
[count, binlocation] = imhist(srImg1);
Scount = sum(count);
Icount = 0;
for i=length(count):-1:1
    Icount = Icount + count(i);
    if Icount/Scount > 0.99
        histmin = binlocation(i);
        break
    end
end
histmax = max(max(srImg1));

if histmax<=histmin
%     error('Error. \n a=%d , b=%d , histmin=%d , histmax=%d',a,b,histmin,histmax);
    newImg = 0;
else
    newImg = imadjust(srImg1 ,[histmin, histmax], []);
end

end


function [ pic, bigger ] = square( Img )
%将长方形图像转变为行列相等的图像，并且输出行列中的较大值
%   赋值时注意要把回复范围从[0,255]的图像转变为[0,1]，
%   这里输入图像Img的灰度范围需要为[0,1]

[row,col] = size(Img);
if row>col
    pic = ones(row,row);    %重新赋值后将会以[0,1]的灰度范围，超过1都为白色
    for i=1:row
        for j=1:col
            bigger = row;   %row和col两者较大者为现在图像的尺寸边长
            pic(i,j) = Img(i,j);
        end
    end
else
    bigger = col;
    pic = zeros(col,col);
    for i=1:row
        for j=1:col
            pic(i,j) = Img(i,j);
        end
    end
end

end


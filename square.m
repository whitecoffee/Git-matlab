function [ pic, bigger ] = square( Img )
%��������ͼ��ת��Ϊ������ȵ�ͼ�񣬲�����������еĽϴ�ֵ
%   ��ֵʱע��Ҫ�ѻظ���Χ��[0,255]��ͼ��ת��Ϊ[0,1]��
%   ��������ͼ��Img�ĻҶȷ�Χ��ҪΪ[0,1]

[row,col] = size(Img);
if row>col
    pic = ones(row,row);    %���¸�ֵ�󽫻���[0,1]�ĻҶȷ�Χ������1��Ϊ��ɫ
    for i=1:row
        for j=1:col
            bigger = row;   %row��col���߽ϴ���Ϊ����ͼ��ĳߴ�߳�
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


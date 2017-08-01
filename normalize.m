function newImg = normalize( srImg, row, col )
%����ͼ��srImg,��row����col��SRϵͳ����a,b�������������Ϣ
%   �������ͼ��Ҷ�ֵƽ���ֲ���[0,1]��������

%��һ��������
Pixmax = max(max(srImg));   
Pixmin = min(min(srImg));
Pixdelta = Pixmax - Pixmin;
srImg1 = zeros(row, col);
for i=1:row
    for j=1:col
        srImg1(i, j) = (srImg(i, j) - Pixmin)/Pixdelta;
    end
end

%����Ҷ�ֵ��ŷ�Χ
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


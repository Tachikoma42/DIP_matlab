f = imread('pic\ckt_board_saltpep.tif');
%f = mat2gray(f, [0 255]);
% 
figure();
subplot(2,3,1);
imshow(f);
title('Original picture');

A=fspecial('average',3); 
% Y=filter2(A,f)/255;
g1 = AverageFilterFunc()

     
                
     
     %实验步骤三:用自己的编写的函数进行�?�值滤波
     Y2=Avefilt(f,n);     %调用自编函数进行�?�值滤波，n为模�?�大�?
     figure,imshow(Y2),title('用自己的编写的函数进行�?�值滤波之�?�的结果'); 
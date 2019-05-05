% 1.主程序
F=imread('lena.bmp');
subplot(231);
imshow(F);
title('Ô-Í¼Ïñ');%显示原图像

F=double(F);
F=F-128; %将原图像减小一半便于处理 
%计算原图像的8×8块的DCT系数，并转换为可视频谱图以便观察
dctfre=DctBlock(F,8);
subplot(232);
imshow(log(abs(dctfre)*5+1),[]);
title('8*8DCT频谱显示'); %[]表示将原图像的最大最小值之间的范围整体映射到0~255之间，即做限幅 
 
DCTch=10;
n=8;
[I,e,rmse1]=ZigIDCT(F,dctfre,DCTch,n);
subplot(233);
imshow(uint8(I));

title(['取',num2str(DCTch),'个DCT系数时的 重建图像']);
subplot(234);
imhist(uint8(abs(e)));
title(['差值直方图， RMSE=',num2str(rmse1)]);
scale=4;
[newbuf,err,rmse2]=QuanIQuan(F,dctfre,n,scale);
subplot(235);
imshow(uint8(newbuf));
title(['scale为',num2str(scale),' 时的重建图像']);
subplot(236);
imshow(uint8(abs(err)),[]);
title(['量化误差图像， RMSE=',num2str(rmse2)]);


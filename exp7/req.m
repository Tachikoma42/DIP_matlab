% 【实验目的】
%     掌握 n×n 块的 DCT 图像变换及频谱特点。 熟悉 JPEG 基本系统的图像编解码方法。 
% 【实验内容】
%     1）编程实现 n×n 块 DCT 变换的图像频谱显示，块 DCT 系数按照 Zig-Zag 扫 描并取部分进行图像重建，计算图像的均方根误差 RMSE，显示误差图像和误差 直方图。
%     2）对 8×8 块的 DCT 系数，采用 JPEG 默认的量化矩阵进行量化和反量化， 计算原图像与重建图像之间的均方根误差 RMSE、并显示误差图像。 
% 【实验代码】


% 1.主程序

F=imread('lena.bmp');
subplot(231);
imshow(F);
title('Ô-Í¼Ïñ');
 %显示原图像

F=double(F);
F=F-128;
%将原图像减小一半便于处理 %计算原图像的8×8块的DCT系数，并转换为可视频谱图以便观察
dctfre=DctBlock(F,8);
subplot(232);
imshow(log(abs(dctfre)*5+1),[]);
title('8*8DCT频谱显示');
 %[]表示将原图像的最大最小值之间的范围整体映射到0~255之间，即做限幅 
 
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

2. ZigIDCT.m 
function [I,e,rmse1]=ZigIDCT(oldbuf,dctfre,DCTch,n) 
    %oldbuf:原始图像数据 
    %dctfre:DCT系数矩阵 
    %DCTch:每个分块中需要保留的DCT系数个数 
    %n:分块的大小 
    %e:原图像与保留部分DCT系数后的重建图像之间的误差矩阵 
    % 按Zig-Zag扫描顺序，根据DCTch参数，只保留64个 % DCT系数中的前DCTch个系数，对修改后的DCT系数用逆DCT变换重建图像，得到DCT变 
    % 换的压缩图像。计算重建图像的均方根误差RMSE ；显示误差图像和误差直方图。 
    zigzag = [ 1  2  6  7 15 16 28 29
                3  5  8 14 17 27 30 43
                4  9 13 18 26 31 42 44
                10 12 19 25 32 41 45 54
                11 20 24 33 40 46 53 55
                21 23 34 39 47 52 56 61
                22 35 38 48 51 57 60 62
                36 37 49 50 58 59 63 64];
    %设置z扫描顺序
    mask=zigzag<=DCTch;
    %根据当前DCTch值得到“Z”字扫描的逻辑值,mask为logic类型 %对修改后的DCT系数用逆DCT变换重建图像，得到DCT变换的压缩图像 
    D=dctmtx(n);
    I=blkproc(dctfre,[n n],'P1*(x.*P2)*P3',D',maskbuf,D);
    %I为重建的压缩图像 矩阵 e=oldbuf-I;
    %e:原图像与保留部分DCT系数后的重建图像之间的误差矩阵 
    I=I+128;
    rmse1=RMSE(e);
end 

3.DctBlock.m

function dctfre = DctBlock(oldbuf,n)  %分块DCT函数：根据给定的n值，计算原图像的n×n块的DCT系数，并转换为可视频谱图以便 观察  
    % oldbuf 原始图像数据   
    %n 分块的大小   
    %dctfre DCT系数矩阵 
    D=dctmtx(n);%D是返回N×N的DCT变换矩阵，矩阵A的DCT变换可用D×A×D’来计算 
    dctfre=blkproc(oldbuf,[n,n],'P1*x*P2',D,D');%D'为D的转置 
end 

4. QuanIQuan.m 
function [newbuf,e,rmse2]=QuanIQuan(oldbuf,dctfre,n,scale) 
%量化和反量化函数：根据给定的默认JPEG量化表， %对每个n×n块的DCT系数进行量化和反量化，显示量化误差图像及其直方图。 
%oldbuf:原始图像数据 
%dctfre:DCT系数矩阵 
%n:分块的大小 
%scale; 量化系数 
z= [16 11 10 16  24  40  51  61
12 12 14 19  26  58  60  55
14 13 16 24  40  57  69  56
14 17 22 29  51  87  80  62
18 22 37 56  68 109 103  77
24 35 55 64  81 104 113  92
49 64 78 87 103 121 120 101
72 92 95 98 112 100 103 99];
 %默认JPEG量化表  Qvalue=blkproc(dctfre,[n n],'round(x./P1)',scale*z);
 %量化  IQvalue=blkproc(Qvalue,[n n],'x.*P1',scale*z);
 %反量化  %对经过量化和反量化后的矩阵进行逆DCT变换得到重建图像矩阵  D=dctmtx(n);
  newbuf=blkproc(IQvalue,[n n],'P1*x*P2',D',D);
  e=newbuf-oldbuf;
 %e为量化误差矩阵  rmse2=RMSE(e);
 %求均方根误差  newbuf=newbuf+128;
 end 
 5. RMSE.m 
 function rmse=RMSE(oldbuf) %求均方根误差
     [M,N]=size(oldbuf);
  e=oldbuf.^2;
  rmse=sqrt(sum(e(:))/(M*N));
end 
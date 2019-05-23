imgI=imread('CLA1.bmp'); %定义参考帧 
imgP=imread('CLA2.bmp'); %定义当前帧 
subplot(231);
imshow(imgI);
title('参考帧');
subplot(232);
imshow(imgP);
title('当前帧');
imgI=double(imgI);
imgP=double(imgP);

mbSize=16; %块尺寸为16*16
p=7; %搜索窗口为(2p+1)*(2p+1)

[motionVect,EScomputations,blk_center,costs]=ME_ES(imgP,imgI,mbSize,p );
 %基于块的全搜索算法
imgMV(motionVect,imgP,blk_center); %画运动矢量图

imgComp=motionComp(imgI,motionVect,mbSize); %根据运动矢量计算预测帧，并传输残差帧 
psnr=imgPSNR(imgP,imgComp); %计算峰值信噪比 
subplot(234);
imshow(uint8(imgComp));
title(['预测 帧,PSNR=',num2str(psnr)]);

imgErr=imgP-imgComp; %残差帧 
cal=Calibration(imgErr); %标定，显示更好效果 
subplot(235);
imshow(cal);
title('残差帧');

ChongJian=imgComp+imgErr;%根据运动矢量指明的位置及残差帧重建图像 
subplot(236);
imshow(uint8(ChongJian));
title('重建帧');
 
refFrame = imread('girl0.bmp');
curFrame = imread('girl1.bmp');

subplot(231);
imshow(refFrame);
title('reference frame');

subplot(232);
imshow(curFrame);
title('current frame');

mbSize=16; % block size 16*16
dm=7; % match time (2dm+1)*(2dm+1)
[motionVect, EScomputations] = ME_ES(curFrame, refFrame, mbSize, dm, 3);

predFrame = motionComp(refFrame, motionVect, mbSize); % input refframe and motionvect to calculate next frame
psnr1 = imgPSNR(curFrame, predFrame);
subplot(234);
imshow(predFrame);
title(strcat('predict frame = ',num2str(psnr1)));

errFrame = uint8(double(curFrame) - double(predFrame)); % error frame;
subplot(235);
imshow(errFrame,[]);
title('error frame');

reFrame = uint8(double(errFrame) + double(predFrame));
subplot(236);
imshow(reFrame);
title('restruct frame');

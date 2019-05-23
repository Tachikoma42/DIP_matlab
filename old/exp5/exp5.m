claP = imread('C:\Users\xkzmx\Documents\Code\Matlab\DIP\pic\CLA1.bmp');
n = 10;
subplot(231);
imshow(claP);
title('original');

subplot(232);
[res1D,qError1]= Dpcm_code(claP,1);
res1DPSRN = psnr(claP,res1D);

imshow(res1D);
title(strcat('1D psnr=',num2str(res1DPSRN)));



subplot(233);
[res2D,qError2] = Dpcm_code(claP,2);
imshow(res2D);
res2DPSRN = psnr(claP,res2D);
title(strcat('2D psnr=',num2str(res2DPSRN)));

subplot(235);
title('1 Dimension DPCM bit error');
resErr1D = Error_Code(claP,qError1, 1);
error1 = uint8(abs(double(res1D)-double(resErr1D))*n);
%error1 = Clip_Value(error1);
imshow(resErr1D);
title('resErr1D');


subplot(236);
title('2 Dimension DPCM bit error');
resErr2D = Error_Code(claP,qError2, 2);
error2 = uint8(abs(double(res2D)-double(resErr2D))*n);
%error2 = Clip_Value(error2);
imshow(resErr2D);
title('resErr2D');

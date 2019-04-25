claP = imread('C:\Users\xkzmx\Documents\Code\Matlab\DIP\pic\CLA1.bmp');

subplot(231);
imshow(claP);
title('original');

subplot(232);
title('1 Dimension DPCM restruction');
[res1D,qError]= Dpcm_code(claP,1);
imshow(res1D);
%res1DPSRN = psnr1(claP,res1D)

subplot(233);
title('2 Dimension DPCM restruction');
[res2D,~] = Dpcm_code(claP,2);
imshow(res2D);
%res2DPSRN = psnr1(claP,res2D)

subplot(235);
title('1 Dimension DPCM bit error');
resErr1D = Error_Code(claP,qError, 1);
imshow(resErr1D);


subplot(236);
title('2 Dimension DPCM bit error');
resErr2D = Error_Code(claP,qError, 2);
imshow(resErr2D);

% subplot(234);
% title('Frame Difference');
% out3 = betweenFrameDifference(claP,res2D);
% x = -255:255;
% plot(x, out3/sum(out3));
% axis([-255 255 0 0.2]);
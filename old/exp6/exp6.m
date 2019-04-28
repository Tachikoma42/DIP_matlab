frame = imread('lena.bmp');
subplot(1,3,1);
title('original pic');
imshow(frame);

subplot(1,3,2);
out1 = btcCode(frame,4);
[psnr1, compressionRatio1] = psnrCr(frame, out1, 4)
title(strcat('4x4 btc, psnr = ',num2str(psnr1),'compression Ratio = ',num2str(compressionRatio1)));
%title('4x4 btc');
imshow(out1);

subplot(1,3,3);
out2 = btcCode(frame, 8);
[psnr2, compressionRatio2] = psnrCr(frame, out2, 8)
title(strcat('4x4 btc, psnr = ',num2str(psnr2),'compression Ratio = ',num2str(compressionRatio2)));
%title('8x8 btc');
imshow(out2);

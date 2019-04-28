frame = imread('pic\lena.bmp');
dim = 8;

subplot(231);
imshow(frame);
title('Original');

dctFreq = dctBlock(frame, 8);
subplot(232);
imshow(log(abs(dctFreq)*5+1),[]);
title('8x8 DCT frequency');

DCTch = 10;
[outFrame,difference, rmse1] = ZigIDCT(frame, dctFreq, DCTch, dim);
subplot(233);
imshow(outframe);
title('when dct Coefficient = 8 restruct pic');

subplot(234);
imhist(uint8(abs(difference)));
title(strcat('difference histro',num2str(rmse1)));
scale = 4;
[reFrame, err, ]
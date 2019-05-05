frame = imread('lena.bmp');
dim = 8;
scale = 4;
DCTch = 10;

subplot(231);
imshow(frame);
title('Original');% display original picture

dctFreq = dctBlock(frame, dim);
subplot(232);
imshow(log(abs(dctFreq)),[]);
title('8x8 DCT frequency');

outFrame1 = dctCode(dctFreq, DCTch, dim);
subplot(233);
imshow(outFrame1);
title('when dct Coefficient = 8 restruct pic');

[difference1, rmse1]= rmse(frame, outFrame1);
subplot(234);
imhist(uint8(abs(difference1)));

title(strcat('difference histro & rmse = ',num2str(rmse1)));

% [reFrame, err, rmse2] = QuanIQuan(frame, dctFreq, dim, scale);
outFrame2 = encodeJpeg(frame,dctFreq, scale, dim);
subplot(235);
imshow(outFrame2);
title('restrcut pic when scale is 4');

[difference2, rmse2]= rmse(frame, outFrame2);
subplot(236);
imshow(uint8(abs(difference2)));
title(strcat('difference histro & rmse = ',num2str(rmse2)));

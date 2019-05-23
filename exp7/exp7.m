frame = imread('lena.bmp');
dim = 8;
scale = 2;
DCTch = 10;

subplot(231);
imshow(frame);
title('Original');% display original picture

dctFreq = dctBlock(frame, dim);
subplot(232);
imshow(log(abs(dctFreq)*5+1),[]);
title('8x8 DCT frequency');

outFrame1 = dctCode(dctFreq, DCTch, dim);%ZigIDCT
subplot(233);
imshow(outFrame1);
title(strcat('restruct pic when dct Coefficient = ', num2str(DCTch)));

[difference1, rmse1]= rmse(frame, outFrame1);
subplot(234);
histogram(difference1);
title(strcat('difference histro & rmse = ',num2str(rmse1)));

outFrame2 = encodeJpeg(dctFreq, scale, dim);%QuanIQuan
subplot(235);
imshow(outFrame2);
title(strcat('restrcut pic when scale is ',num2str(scale)));

[difference2, rmse2]= rmse(frame, outFrame2);
subplot(236);
imshow(displayCalibration(difference2));
title(strcat('difference after quantization rmse = ',num2str(rmse2)));

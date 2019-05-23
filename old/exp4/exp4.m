riceP = imread('rice.bmp');
girl0P = imread('girl0.bmp');
girl1P = imread('girl1.bmp');

x = -255:255;
out1 = interFrameVerticalDifference(riceP);
out2 = interFrameHorizontalDifference(riceP);
out3 = betweenFrameDifference(girl0P, girl1P);

subplot(231);
imshow(riceP);
title('original');

subplot(234);
imshow(girl0P);
title('girl0');

subplot(235);
imshow(girl1P);
title('girl1');

subplot(232);
plot(x, out1/sum(out1));
axis([-255 255 0 0.6]);
title('Vertical Difference');

subplot(233);
plot(x, out2/sum(out2));
axis([-50 50 0 0.4]);
title('Horizontal Difference');

subplot(236);
plot(x, out3/sum(out3));
axis([-255 255 0 0.2]);
title('Frame Difference');

riceP = imread('.\pic\rice.bmp');
girl0P = imread('.\pic\girl0.bmp');
girl1P = imread('.\pic\girl1.bmp');

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
title('Vertical Difference');
plot(x, out1/sum(out1));
axis([-255 255 0 0.6]);

subplot(233);
title('Horizontal Difference');
plot(x, out2/sum(out2));
axis([-50 50 0 0.4]);

subplot(236);
title('Frame Difference');
plot(x, out3/sum(out3));
axis([-255 255 0 0.2]);







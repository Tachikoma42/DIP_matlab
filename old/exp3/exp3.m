frame = imread('rice.bmp');
subplot(241);
imshow(frame);
title('original');

out1 = Roberts(frame);
subplot(242);
imshow(out1);
title('Roberts filter');%

enhance1 = out1 + frame;
enhance1 = Clipper(enhance1);%
subplot(246);
imshow(enhance1);
title('Roberts Enhance');

out2 = Sobel(frame);%
subplot(243);
imshow(out2);
title('Sobel filter');

enhance2 = out2 + frame;
enhance2 = Clipper(enhance2);%
subplot(247);
imshow(enhance2);
title('Sobel Enhance');

out3 = Laplace(frame);
% negative center coefficient
enhance3 = frame - out3;

out3 = displayCalibration(out3);
subplot(244);
imshow(out3);
title('Laplace filter');

% negative center coefficient
%enhance3 = frame - out3;
enhance3 = Clipper(enhance3);%
subplot(248);
imshow(enhance3);
title('Laplace Enhance');

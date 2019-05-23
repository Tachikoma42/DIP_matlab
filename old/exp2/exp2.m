I = imread('lena.bmp');
f = imnoise(I,'salt & pepper',0.02);% ???? 

subplot(231);
imshow(f);
title('pic with noise')% ?????????

% ?????? 
%A3 = fspecial('average',3); 
%g2 = filter2(A3, f); 
%A5 = fspecial('average',5); 
%g3 = filter2(A5, f);
% ??????
g1 = AverageFilterFunc(f, 3); % 3x3????
subplot(232);
imshow(g1);
title('3x3 average');

g2 = AverageFilterFunc(f, 5);% 5x5???? 
subplot(233);
imshow(g2);
title('5x5 average');

g3 = WeightedFilterFunc(f); % 3x3???? 
subplot(234);
imshow(g3);
title('weighted pic');

% ?????? 
%g5 = medfilt2(f, [3 3]); 
%g6 = medfilt2(f, [5 5]);

% ??????
g4 = MedianFilterFunc3x(f); % 3x3????
subplot(235);
imshow(g4);
title('3x3 median pic');

g5 = MedianFilterFunc5x(f);% 5x5????
subplot(236);
imshow(g5);
title('5x5 median pic');
f = imread('lena.bmp'); % ???? 
subplot(3,3,1);
imshow(f);
title('Original picture');% ?????

%g1 = StretchFunc(f, -150, 20, 50, 180); % ????????????
g1 = LinearTransformFunc(f, 2, 10); %??????????
subplot(3,3,2);
imshow(g1);
title('Stretch'); % ???????

g2 = 255 - f;% ??????????
subplot(3,3,3);
imshow(g2);
title('reverse'); % ??????


C = 1;
Gamma1 = 4;
Gamma2 = 1;
gamma3 = 0.4;
g = double(g);
g3 = C * (g.^Gamma1); % ? > 1
g4 = C * (g.^Gamma2); % ? = 1
g5 = C * (g.^gamma3); % ? < 1
g = uint8(g);
subplot(3,3,4);
imshow(g3);
title('gamma > 1'); 

subplot(3,3,5);
imshow(g4);
title('gamma = 1');

subplot(3,3,6);
imshow(g5);
title('gamma < 1');

subplot(3,3,7);
ImHist(f); 
title('Histogram'); % ???????

g6 = Normalize(f); %???????????
subplot(3,3,8);
imshow(g6);
title('Normalize');

%  g6=histeq(f);%?????????????
% subplot(3,3,8);
% imshow(g6);
% title('Normalize');

subplot(3,3,9);
ImHist(g6); 
title('Histogram after Norm'); % ?????????
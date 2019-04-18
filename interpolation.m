i=imread('lena.jpg');
%i=rgb2gray(i);
b=imrotate(i,0,'nearest');
c=imrotate(i,0,'bilinear');
d=imrotate(i,0,'bicubic');
subplot(2,2,1),imshow(i);
title('原图�?');
subplot(1,3,1),imshow(b);
title('最邻近差值');
subplot(1,3,2),imshow(c);
title('�?�线性差值');
subplot(1,3,3);imshow(d);
title('�?�三次差值');
%%
% 
% $$e^{\pi i} + 1 = 0$$
% 
% $$e^{\pi i} + 1 = 0$$
% 
% 

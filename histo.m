I=imread('lena.jpg'); 
subplot(1,2,1)
imshow(I);
title('Original Image');
G=rgb2gray(I); 
subplot(1,2,2); 
imhist(G); 
title('Histogram');
f = imread('pic\lena.bmp');
f = mat2gray(f, [0 255]);

C = 1;
Gamma =4;
g2 = C * (f.^Gamma);

figure();
subplot(1,2,1);
imshow(f);

set(get(gca, 'XLabel'), 'String', 'a).Original Image');

subplot(1,2,2);
imshow(g2);
set(get(gca, 'XLabel'), 'String', 'b).Gamma Transformations \gamma = 0.4');
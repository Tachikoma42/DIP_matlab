f = imread('C:\Users\xkzmx\Documents\Code\Matlab\DIP\test\blurry_moon.tif');
figure();
subplot(2,2,1);
imshow(f);
w = fspecial('laplacian', 0);
w=[1 1 1;1 -8 1;1 1 1];
g1 = imfilter(f, w, 'replicate');
subplot(2,2,2);
imshow(g1);
f2 = double(f);
g2 = imfilter(f2, w, 'replicate');
subplot(2,2,3);
imshow(g2,[]);
g=f2-g2;
subplot(2,2,4);
imshow(g,[]);


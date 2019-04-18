f = imread('DFT_no_log.tif');
f = mat2gray(f, [0 255]);

%v = 10;

%g_1 = log2(1 + v * f) / log2(v + 1);
g_1 = 255 -1 - f;


v = 30;

g_2 = log2(1 + v * f) / log2(v + 1);

v = 200;
g_3 = log2(1 + v * f) / log2(v + 1);

figure();
subplot(2,2,1);
imshow(f, [0 1]);
set(get(gca, 'XLabel'), 'String', 'a).Original Image');
subplot(2,2,2);
imshow(g_1, [0 1]);
set(get(gca, 'XLabel'), 'String', 'b).Log Transformations v = 10');


subplot(2,2,3);
imshow(g_2, [0 1]);
set(get(gca, 'XLabel'), 'String', 'c).Log Transformations v = 100');

subplot(2,2,4);
imshow(g_3, [0 1]);
set(get(gca, 'XLabel'), 'String', 'd).Log Transformations v = 200');
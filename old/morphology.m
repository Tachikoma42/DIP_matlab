% A1 = imread('.\test\text_gaps_1_and_2_pixels.tif');
% B = [0 1 0;1 1 1;0 1 0];
% A2 = imdilate(A1, B);
% A3 = imdilate(A2, B);
% A4 = imdilate(A3, B);

% subplot(221);
% imshow(A1);

% subplot(222);
% imshow(A2);

% subplot(223);
% imshow(A3);

% subplot(224);
% imshow(A4);

% A1 = imread('.\test\wirebond-mask.tif');
% subplot(221);
% imshow(A1);

% se1 = strel('disk', 5);% to build a disk with radius of 5
% A2 = imerode(A1, se1);
% subplot(222);
% imshow(A2);

% se2 = strel('disk', 10);
% A3 = imerode(A1, se2);
% subplot(223);
% imshow(A3);

% se3 = strel('disk', 20);
% A4 = imerode(A1, se3);
% subplot(224);
% imshow(A4);

q = imread('.\test\Annotation 2019-03-27 165713.jpg');
f = rgb2gray(q);

%se = strel('square', 5');
se = strel('disk', 25);
imshow(f);
fo = imopen(f, se);
subplot(221);
imshow(fo);
fc = imclose(f, se);
subplot(222);
imshow(fc);

foc = imclose(fo, se);
subplot(223);
imshow(foc);

fco = imopen(fc, se);
subplot(224);
imshow(fco);

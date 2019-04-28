f = imread('washed_out_aerial_image.tif');
%f = imread('einstein_orig.tif');
f = mat2gray(f , [0 255]);

[M, N] = size(f);
g = zeros(M, N);

Min_f = min(min(f));
Max_f = max(max(f));
m = (Min_f + Max_f) / 2;

Out_put_min = 0.05;
Out_put_max = 0.95;

E_1 = log(1/Out_put_min - 1) / log(m/(Min_f + eps));
E_2 = log(1/Out_put_max - 1) / log(m/(Max_f + eps));
E = ceil(min(E_1, E_2)-1);

g= 1 ./(1 + (m ./ (f + eps))^E);
g = mat2gray(g, [1/(m/eps)^E] 1/(1+(m/1+eps)^E)]);

figure();
subplot(2,2,1);
imshow(f, [0 1]);
set(get(gca, 'XLabel'), 'String', 'a).Original Image');

subplot(2,2,2);
r = imhist(f) / (M * N);
bar(0:1/255:1,r);
axis([0 1 0 max(r)]);
set(get(gca, 'XLabel'), 'String', 'b).The Histogram of a');
set(get(gca, 'YLabel'), 'String', 'Number of pixels');

subplot(2,2,3);
imshow(g, [0 1]);
set(get(gca, 'XLabel'), 'String', 'c).Results of Contrast stretching');

subplot(2,2,4);
s = imhish(g)/(M*N);
bar(0:1/255:1, s);
axis([0 1 0 max(s)]);
set(get(gca, 'XLabel'), 'String', 'b.)The Histogram of a');
set(get(gca, 'YLabel'), 'String', 'Number of pixels');

in_put = 0:1/255:1;
Out_put1 = 1 ./(1 + (m ./ (double(in_put)+ eps)).^E);
Out_put1 = mat2gray(Out_put1,[1/(1+(m/eps)^E) 1/(1+(m/1+eps)^E)]);

figure();
plot(in_put,Out_put1);
axis([0,1,0,1]),grid;
axis square;
xlabel('Input intensity level');
ylabel('Onput intensity level');


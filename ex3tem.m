% I = imread('.\pic\butterfly.bmp');
% imshow(I);
% I = double(I); % 转�?�为double型，这样�?�以�?存负值，�?�则uint8型会把负值截掉 
% w1 = [-1 0; 0 1]; 
% w2 = [0 -1; 1 0]; 
% G1 =  imfilter(I, w1, 'corr', 'replicate'); % 以�?�?方�?填充边界 
% G2 =  imfilter(I, w2, 'corr', 'replicate'); 
% G = abs(G1) + abs(G2); % 计算Robert梯度  
% figure, 
% imshow(G, []);  
% figure, 
% imshow(abs(G1), []); 
% figure, 
% imshow(abs(G2), []);

I = imread('.\pic\butterfly.bmp');
% subplot(221)
% imshow(I);
% I = double(I);
% w1 = [0 -1 0; -1 4 -1; 0 -1 0];
% L1 = imfilter(I, w1, 'corr', 'replicate');
% w2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
% L2 = imfilter(I, w2, 'corr', 'replicate');
% subplot(222)
% imshow(abs(L1), []);
% subplot(223)
% imshow(abs(L2), []);
% w3 = [1 4 1; 4 -20 4; 1 4 1];
% L3 = imfilter(I, w3, 'corr', 'replicate');
% subplot(224)
% imshow(abs(L3), []); 

subplot(231);
imshow(I);


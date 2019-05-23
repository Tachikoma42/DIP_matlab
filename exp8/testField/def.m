1. main.m
refFrame = imread('girl0.bmp');
curFrame = imread('girl1.bmp');
 
subplot(231);
imshow(refFrame);
title('reference frame');
 
subplot(232);
imshow(curFrame);
title('current frame');
 
mbSize=16; % 块尺寸为16*16
dm=7; % 匹配次数为(2dm+1)*(2dm+1)
[motionVect, EScomputations] = ME_ES(curFrame, refFrame, mbSize, dm, 3);%全搜索函数&运动矢量图
 
predFrame = motionComp(refFrame, motionVect, mbSize); % 参考帧+运动矢量图 = 预测帧
psnr1 = imgPSNR(curFrame, predFrame);
subplot(234);
imshow(predFrame);
title(strcat('predict frame = ',num2str(psnr1)));
 
errFrame = uint8(double(curFrame) - double(predFrame)); % error frame;
subplot(235);
imshow(errFrame,[]);
title('error frame');
 
reFrame = uint8(double(errFrame) + double(predFrame)); %残差帧+运动矢量 = 重建帧
subplot(236);
imshow(reFrame);
title('restruct frame');


2.ME_ES.m
function [motionVect, EScomputations] = ME_ES(curFrame, refFrame, mbSize, dm, a)
% Input
%   	curFrame : 当前帧
%   	refFrame : 参考帧
%   	mbSize : MB尺寸
%   	dm : 搜索窗口大小（2dm+1）×（2dm+1）
% Ouput
%   	motionVect : 整像素精度MV
%   	EScomputations: 搜索每个宏块所需的平均点数
    curSlice = double(curFrame);
    refSlice = double(refFrame);
 
    [row, col] = size(curSlice);
    motionVect = zeros(2, row*col/(mbSize*mbSize)); %prealloc motion vector 
    blockCenter = zeros(2,row*col/(mbSize*mbSize)); %prealloc motion block center to draw vector
    cost = ones(2*dm+1, 2*dm+1)*(255+255)*mbSize;
    totalSearchScore = 0; % 搜索每个宏块所需的平均点数
    mbCount = 1;
    for i = 1:mbSize:row-mbSize+1 %start row of the search, added by block number
        for j = 1:mbSize:col-mbSize+1 %start col of the search, added by block number
            for k = -dm:dm
                for l = -dm:dm
                    refBlockRow = i + k; %start row of the search
                    refBlockCol = j + l; %start col of the search
                    if (refBlockRow < 1 || refBlockRow+mbSize-1>row)
                        continue;
                    end%越界处理
                    if (refBlockCol < 1 || refBlockCol+mbSize-1>col)
                        continue;%处理越界
                    end
                    %计算该点sad值
                    cost(k+dm+1, l+dm+1) = costSAD(curSlice(i:i+mbSize-1,j:j+mbSize-1), refSlice(refBlockRow:refBlockRow +mbSize -1, refBlockCol:refBlockCol+mbSize-1));
                    totalSearchScore = totalSearchScore + 1;
                end
            end
            blockCenter(1, mbCount) = i + mbSize/2 -1; %motion block center row
            blockCenter(2, mbCount) = j + mbSize/2 -1; %motion block center col
            [dx, dy] = minCost(cost); % find the block that has the smallest cost
            motionVect(1, mbCount) = dx - dm - 1; % motion vector row
            motionVect(2, mbCount) = dy - dm - 1; % motion vector col
            mbCount = mbCount + 1;
            cost = ones(2*dm+1, 2*dm+1)*(255+255)*mbSize; % 重新赋给最大值开始新一轮的搜索
        end
    end
    EScomputations = totalSearchScore/(mbCount-1);
    subplot(2,3,a);
    imshow(curFrame);
    title('motion vector pic');
    hold on;
    x = blockCenter(2, :); %col = x;
    y = blockCenter(1, :); %row = y;
    u = motionVect(2, : ); %motion col = u;
    v = motionVect(1, : ); %motion row = v;
    quiver(x, y, u, v, 'green');
    hold off;
end

3. costSAD.m
function cost = costSAD(currentBlk,refBlk)
% Input
%       currentBlk : 当前块
%       refBlk : 参考块
%       mbSize : MB尺寸
% Output
%       cost : 两个块之间的误差代价（SAD）	    
cost = sum(sum(abs(currentBlk-refBlk)));
end

4. imgPSNR.m
function psnr = imgPSNR(refFrame, predFrame)
    % Input
    %   	refFrame : 原始帧
    %   	predFrame : 预测帧
    % Ouput
    %   	psnr : 运动补偿后的图像的PSNR
		 
    [row, col] = size(refFrame);
    MSE = sum(sum((double(refFrame)-double(predFrame)).^2))/(row*col);
    psnr = 10*log10(255^2/MSE);
end


5. minCost.m
function [dx, dy] = minCost(cost)
    % Input
%       costs : 包含当前宏块所有运动估计误差代价的SAD矩阵
% Output
%       dx : MV的垂直分量（行位移）
%       dy : MV的水平分量（列位移）

    [row, col] = size(cost);
    dx = 1;
    dy = 1;
    for i = 1:row
        for j = 1:col
            if(cost(i,j) < minc)
                dx = i;
                dy = j;
            end
        end
    end
end

6. motionComp.m
function predFrame = motionComp(refFrame, motionVect, mbSize)
%求预测帧的函数：由给定的运动矢量进行运动补偿计算预测帧
% Input
%       imgI : 参考帧
%       motionVect : MV（dx为垂直分量，dy为水平分量）
%   	mbSize : MB尺寸
% Ouput
%   	imgComp : 运动补偿后的图像
    refSlice = double(refFrame);
    [row, col] = size(refSlice);
    mbCount = 1;
    for i = 1:mbSize:row-mbSize+1
        for j = 1:mbSize:col-mbSize+1
            refBlockRow = i + motionVect(1, mbCount); %start row of the search
            refBlockCol = j + motionVect(2, mbCount); %start col of the search
            predFrame(i:i+mbSize-1,j:j+mbSize-1) = refSlice(refBlockRow:refBlockRow + mbSize -1, refBlockCol:refBlockCol+mbSize-1);
            mbCount = mbCount + 1;
        end
    end
    predFrame = uint8(predFrame);
end

function [motionVect,EScomputations,blk_center,costs] = ME_ES(curFrame, refFrame, mbSize, p) 
    %function:FS算法：全搜索（Full Search/Exhaustive Search） 
    %curFrame:当前帧 
    %refFrame:参考帧 
    %mbSize:MB尺寸   
    %p:搜索窗口大小（2p+1）×（2p+1） 
    %motionVect:整像素精度MV 
    %EScomputations:搜索每个宏块所需的平均点数 
    [row,col]=size(curFrame);
    blk_center=zeros(2,row*col/(mbSize^2)); %定义每个宏块中心点位置 
    motionVect=zeros(2,row*col/(mbSize^2)); %定义每个宏块运动矢量 
    costs=ones(2*p+1,2*p+1)*65537;
    computations=0; %搜索的点数之和 
    mbCount=1;
    for i = 1:mbSize:row-mbSize+1 %当前帧起始行搜索范围，步长是块数      
        for j = 1:mbSize:col-mbSize+1 %当前帧起始列搜索范围，步长是块数         
            for m=-p:p             
                for n=-p:p
                    ref_blk_row=i+m; %参考帧搜索框起始行                 
                    ref_blk_col=j+n; %参考帧搜索框起始列                 
                    %如果参考块的行列范围的任意一点在已经搜索过的宏块之外，
                    %则跳过，搜 索下一点
                    if (ref_blk_row<1||ref_blk_row+mbSize1>row||ref_blk_col<1||ref_blk_col+mbSize-1>col)
                        continue;
                    end                 
                    %否则计算该点SAD值                 
                    costs(m+p+1,n+p+1)=costSAD(curFrame(i:i+mbSize1,j:j+mbSize-1),refFrame(ref_blk_row:ref_blk_row+mbSize1,ref_blk_col:ref_blk_col+mbSize-1));
                    computations=computations+1;
                end         
            end         
            blk_center(1,mbCount) = i+ mbSize/2-1; %记录中心点行坐标                              
            blk_center(2,mbCount) = j+ mbSize/2-1; %记录中心点列坐标         
            [minc,dx,dy]=minCost(costs); %找出有最小代价的块的下标         
            motionVect(1,mbCount)=dx-p-1; %垂直运动矢量         
            motionVect(2,mbCount)=dy-p-1; %水平运动矢量         
            mbCount=mbCount+1;
            costs=ones(2*p+1,2*p+1)*65537; %重新赋值      
        end 
    end 
    EScomputations=computations/(mbCount-1);

end
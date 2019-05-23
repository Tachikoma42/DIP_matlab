function [minc,dx,dy] = minCost(costs) 
    %求具有最小SAD值的函数：找出具有最小代价的块的下标 
    %costs:包含当前宏块所有运动估计误差代价的SAD矩阵 
    %dx:MV的垂直分量 
    %dy:MV的水平分量 
    [row,col]=size(costs);
    minc=costs(1,1);
    dx=1;
    dy=1;
    for i=1:row     
        for j=1:col         
            if(costs(i,j)<minc)         
                minc=costs(i,j);
                dx=i;
                dy=j;
            end     
        end 
    end 
end 
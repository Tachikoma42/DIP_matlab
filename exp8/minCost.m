function [dx, dy] = minCost(cost)

    [row, col] = size(cost);
    minc = cost(1,1); % set mincost to the first 
    dx = 1;
    dy = 1;
    for i = 1:row
        for j = 1:col
            if(cost(i,j) < minc)
                minc = cost(i,j);
                dx = i;
                dy = j;
            end
        end
    end
end
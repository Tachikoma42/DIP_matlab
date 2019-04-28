function [result] = Clipper(input)
    transf = input;
    transf = uint8(transf);
    [row, col] = size(transf);
    for i = 1: row
        for j = 1:col
            if(transf(i,j)>255)
                transf(i,j) = 255;
            elseif(transf(i,j)<0)
                transf(i,j) = 0;
            else 
                transf(i,j) = transf(i,j);
            end
        end
    end
    result = transf;
end

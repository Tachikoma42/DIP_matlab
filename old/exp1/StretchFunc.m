function [ new ] = StretchFunc(original, x1, y1, x2, y2 )
% (x1, y1) & (x2, y2) ?????
    new = original; % ????????
    
    row = size(new, 1);
    col = size(new, 2);

    k1 = y1 / x1;

    dk1 = (y2 - y1) / (x2 - x1); % ????
    dk2 = (255 - y2) / (255 - x2);

    for i = 1 : row % 2?for????????
        %??????????
        for j = 1 : col
            x = new(i, j);
            if x < x1
                new(i, j) = k1 * x;
            elseif x < x2
                new(i, j) = dk1 * (x - x1) + y1;
            else
                new(i, j) = dk2 * (x - x2) + y2;
            end
        end
    end
end

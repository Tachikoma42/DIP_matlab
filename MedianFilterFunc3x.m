function result =MedianFilterFunc3x(f)
    [row, col] = size(f);
    result = ones(row, col);
    vect1 = double(f);
    for i = 2 : row -1
        for j = 2 : col - 1
            result(i,j) = median([vect1(i-1,j-1) vect1(i-1,j) vect1(i-1, j+1) vect1(i,j-1) vect1(i,j) vect1(i, j+1) vect1(i+1,j-1) vect1(i+1,j) vect1(i+1, j+1)]);
        end
    end
    
    for i = 2 : row - 1
        result(i,1) = result(i, 2);
        result(i, col) = result(i, col - 1);
    end
    
    result(1, :) = result(2, :);
    result(row, :) = result(row - 1, :);    
    result = uint8(result);
    
end


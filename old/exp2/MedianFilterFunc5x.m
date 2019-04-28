function result =MedianFilterFunc5x(f)
    [row, col] = size(f);
    result = ones(row, col);
    vect1 = double(f);
    for i = 3 : row -2
        for j = 3 : col -2
            result(i,j) = median([vect1(i-2,j-2) vect1(i-2,j-1) vect1(i-2,j) vect1(i-2,j+1) vect1(i-2,j+2) vect1(i-1,j-2) vect1(i-1,j-1) vect1(i-1,j) vect1(i-1,j+1) vect1(i-1,j+2) vect1(i,j-2) vect1(i,j-1) vect1(i,j) vect1(i,j+1) vect1(i,j+2) vect1(i+1,j-2) vect1(i+1,j-1) vect1(i+1,j) vect1(i+1,j+1) vect1(i+1,j+2) vect1(i+2,j-2) vect1(i+2,j-1) vect1(i+2,j) vect1(i+2,j+1) vect1(i+2,j+2)]);
        end
    end
    
    for i = 3 : row -2
        result(i,1) = result(i, 3);
        result(i,2) = result(i, 3);
        result(i, col -1) = result(i, col - 2);
        result(i, col) = result(i, col - 2);
    end
    
    result(1, :) = result(3, :);
    result(2, :) = result(3, :);
    result(row, :) = result(row - 2, :);
    result(row-1, :) = result(row - 2, :);
    
    result = uint8(result);
    
end


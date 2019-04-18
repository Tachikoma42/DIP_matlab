function [ result ] = Sobel(input)
    operator1 = [-1 -2 -1; 0 0 0; 1 2 1];
    operator2 = [-1 0 1; -2 0 2; -1 0 1];
    
    transf = input;
    [row, col] = size(transf); 
    transf = double(transf); 
    transf = padarray(transf,[1 1],'replicate');
    
    process = zeros(row+2, col+2);
    result = zeros(row, col);
    for i = 2:row+1
        for j = 2:row+1
            kernel = [transf(i-1, j-1) transf(i-1, j) transf(i-1, j+1); transf(i, j-1) transf(i, j) transf(i, j+1);transf(i+1, j-1) transf(i+1, j) transf(i+1, j+1)];
            Gx = operator1.* kernel;
            Gy = operator2.* kernel;
            process(i, j) = abs(sum(Gx(:))) + abs(sum(Gy(:)));
        end
    end
    result(1:row, 1:col) = process(2:row+1, 2:col+1);
    result = uint8(result);

end
function [ result ] = Laplace(input)
    operator1 = [0 1 0; 1 -4 1; 0 1 0];
    operator2 = [1 1 1; 1 -8 1; 1 1 1];

    transf = input;
    [row, col] = size(transf); 
    transf = double(transf); 
    transf = padarray(transf,[1 1],'replicate');

    process = zeros(row+2, col+2);
    result = zeros(row, col);
    for i = 2:row+1
        for j = 2:row+1
            kernel = [transf(i-1, j-1) transf(i-1, j) transf(i-1, j+1); transf(i, j-1) transf(i, j) transf(i, j+1);transf(i+1, j-1) transf(i+1, j) transf(i+1, j+1)];
            Gs = operator1.*kernel;
            process(i, j) = sum(Gs(:));
        end
    end
    result(1:row, 1:col) = process(2:row+1, 2:col+1);
    result = uint8(result);
end

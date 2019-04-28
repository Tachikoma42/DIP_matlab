function result = Roberts(input)
    %Roberts cross-gradient operators
    operator1 = [-1 0; 0 1];
    operator2 = [0 -1; 1 0];

    transf = input;
    [row,col] = size(transf); 
    transf = double(transf); 
    transf = padarray(transf,[1 1],'replicate','post');
    %transf = zeros(row+2,col+2); 
    %transf(2:row+1,2:col+1) = transf(1:row, 1:col);

    process = zeros(row+1,col+1); 
    result = zeros(row, col);

    for i=1:row 
        for j=1:col
            kernel = [transf(i, j) transf(i, j+1); transf(i+1, j) transf(i+1, j+1)];
            Gx = operator1.* kernel;
            Gy = operator2.* kernel;
            process(i, j) = abs(sum(Gx(:))) + abs(sum(Gy(:)));

        end
    end
    result(1:row, 1:col) = process(1:row, 1:col);
    result = uint8(result);
end


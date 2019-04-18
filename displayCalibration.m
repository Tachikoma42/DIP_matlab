function [ result ] = displayCalibration(input)
    transf = input;
    [row, col] = size(transf); 
    transf = double(transf); 
    
    Fs = zeros(row, col);
    Fs = double(Fs);
    
    Fm = zeros(row, col);
    Fm = double(Fm);
    
    for i = 1:row
        for j = 1:col
            Fm(i, j) = transf(i, j) -min(min(Fm));
        end
    end

    for i = 1:row
        for j = 1:col
            Fs(i, j) = 255*(Fm(i, j)/(max(max(Fm))));
        end
    end
    result = uint8(Fs);
end

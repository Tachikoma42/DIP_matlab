function [ result ] = displayCalibration(frame)
    slice = double(frame);
    [row, col] = size(slice); 
    
    Fs = double(zeros(row, col));    
    Fm = double(zeros(row, col));
    
    for i = 1:row
        for j = 1:col
            Fm(i, j) = slice(i, j) -min(min(Fm));
        end
    end

    for i = 1:row
        for j = 1:col
            Fs(i, j) = 255*(Fm(i, j)/(max(max(Fm))));
        end
    end
    result = uint8(Fs);
end

function [outFrame,qError] = Dpcm_code(frame, dim)
    [row, col] = size(frame);
    slice = zeros(row, col);
    qError = zeros(row,col);
    for i = 1:row
        for j = 1:col
            predictVal = Predict_Value(slice, i, j, col, dim);
            predictErr = double(frame(i,j)) -double(predictVal);
            encodedByQuant = Quant_Value(predictErr);
            qError(i,j) = encodedByQuant;
            restortVal = Restor_Value(encodedByQuant,predictVal);
            slice(i, j) = Clip_Value(restortVal);
        end
    end
    outFrame = uint8(slice);
end

function outFrame = Error_Code(frame, qError, dim)
    [row, col] = size(frame);
    slice = zeros(row,col);
    qError(100,100)= 255;
    for i = 1:row
        for j = 1:col
            predictVal = Predict_Value(slice, i, j, col, dim);
            predictErr = qError(i,j);
            %encodedByQuant = Quant_Value(predictErr);
            restortVal = Restor_Value(predictErr,predictVal);
            slice(i, j) = Clip_Value(restortVal);
        end
    end
    outFrame = uint8(slice);

end
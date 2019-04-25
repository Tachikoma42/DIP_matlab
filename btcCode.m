function outframe = btcCode(frame,dim)
%btcCode - use singleBtc.m to calculate every single btc and combine them together
%
% Syntax: outframe = btcCode(frame,dim)
%
% Long description
    [row,col] = size(frame);
    subRow = row/dim;
    subCol = col/dim;
    for i = 1:subRow
        for j = 1:subCol
            individualBtc = frame(((i-1)*dim+1):((i-0)*dim),((j-1)*dim+1):((j-0)*dim));
            outframe(((i-1)*dim+1):((i-0)*dim),((j-1)*dim+1):((j-0)*dim)) = singleBtc(individualBtc, dim);
        end
    end
    outframe = uint8(outframe);
end
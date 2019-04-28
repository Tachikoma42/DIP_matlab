function outBtc = singleBtc(inBtc,dim)
%singleBtc - calculate single block and
%
% Syntax: outBtc = singleBtc(inBtc, dim)
%
    slice = double(inBtc);
    totalPix = 0;
    totalPixNumber = dim*dim;
    totalPixLower = 0;
    totalPixHigher = 0;
    numberPixHigher = 0;
    %outBtc = zeros(dim, dim);
    for i = 1:dim
        for j = 1:dim
            totalPix = totalPix + slice(i,j);
        end
    end
    threshold = totalPix/totalPixNumber;
    
    for i = 1:dim
        for j = 1:dim
            if slice(i,j) < threshold
                totalPixLower = totalPixLower + slice(i,j);
            else
                totalPixHigher = totalPixHigher + slice(i,j);
                numberPixHigher = numberPixHigher+1;
            end
        end
    end
    if numberPixHigher < totalPixNumber
        pixHighter = totalPixLower/ (totalPixNumber-numberPixHigher);
        pixHighter = uint8(pixHighter);
    end
    
    if numberPixHigher > 0
        pixLower = totalPixHigher/numberPixHigher;
        pixLower = uint8(pixLower);
    end
    
        if numberPixHigher == totalPixNumber
            pixHighter = threshold;
        end

    for i = 1:dim
        for j = 1:dim
            if slice(i,j) < threshold
                outBtc(i,j) = pixHighter;
            else
                outBtc(i,j) = pixLower;
            end
        end
    end
end
function psnr = imgPSNR(refFrame, predFrame)

    [row, col] = size(refFrame);
    MSE = sum(sum((double(refFrame)-double(predFrame)).^2))/(row*col);
    psnr = 10*log10(255^2/MSE);
end

function [PSNR, MSE]=psnr1(ori,deter)
    Diff = abs(double(ori)-double(deter));
    MSE = sum(Diff(:).^2)/numel(ori);
    PSNR=10*log10(255^2/MSE);
end

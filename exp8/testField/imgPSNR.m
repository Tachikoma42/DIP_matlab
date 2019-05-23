function psnr = imgPSNR(imgP, imgComp) 
    % 计算运动补偿图像的峰值信噪比 
    % Input 
    %   imgP : 原始图像 
    %   imgComp : 补偿图像 
    % Ouput 
    %   psnr : 峰值信噪比 
    [M,N]=size(imgP); 
    MSE=sum(sum((imgP-imgComp).^2))/(M*N); 
    psnr=10*log10(255^2/MSE); 
end
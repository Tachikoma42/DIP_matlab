function [psnr,compressionRatio] = psnrCr(ori,trans,dim)
%psnrCr - calculate the psnr and the compression ratio
%
% Syntax: [psnr,compressionRatio] = psnrCr(ori,trans,dim)
%
	[row,col] = size(ori);
	mse = sum(sum((ori - trans).^2))/(row*col);
	psnr = 10*log10((255^2)/mse);
	compressionRatio = 8/(1+2*8/(dim*dim));
end
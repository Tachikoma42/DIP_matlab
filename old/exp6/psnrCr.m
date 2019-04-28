function [psnrout,compressionRatio] = psnrCr(ori,trans,dim)
%psnrCr - calculate the psnr and the compression ratio
%
% Syntax: [psnrout,compressionRatio] = psnrCr(ori,trans,dim)
%
	psnrout = psnr(ori,trans);
	compressionRatio = 8/(1+2*8/(dim*dim));
end
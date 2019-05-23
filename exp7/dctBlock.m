function dctFreq = dctBlock(frame, dim)
	%dctBlock - Description
	%
	% Syntax: dctFreq = dctBlock(frame, dim)
	%
	% calculate frame's dct coffincence, and display it as a frequency pic

	% retMat = dctmtx(dim);
	% dctFreq = blkproc(frame, [dim, dim], 'P1*x*P2', retMat, retMat');
%     frame = imread('lena.bmp');
%      dim = 8;
	slice = double(frame);
    %retMat = dctmtx(dim);%return a dct transformation matrix(double)
    %dctFreq=blkproc(slice, [dim dim], 'P1*x*P2', retMat, retMat');% retMat*slice[dim dim]*retMat' to calculate discrete cos transformation
    dctFreq=blkproc(slice, [dim dim], 'dct2');
end
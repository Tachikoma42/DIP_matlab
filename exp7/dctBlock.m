function dctFreq = dctBlock(frame, dim)
%dctBlock - Description
%
% Syntax: dctFreq = dctBlock(frame, dim)
%
% calculate frame's dct coffincence, and display it as a frequency pic

	% retMat = dctmtx(dim);
	% dctFreq = blkproc(frame, [dim, dim], 'P1*x*P2', retMat, retMat');

	slice = double(frame);
    retMat = dctmtx(dim);
    dctFreq=blkproc(slice, [dim dim], 'P1*x*P2', retMat, retMat');
    
end
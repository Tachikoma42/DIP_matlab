function [outFrame] = dctCode(dctFreq, DCTch, dim)
%dctCode - Description
%
% Syntax: outFrame = dctCode(frame, DCTch)
%
% Calculate the DCT transfer of the block of the pic, and follow the z to scan
	zigzag = [1 2 6 7 15 16 28 29
			3 5 8 14 17 27 30 43
			4 9 13 18 26 31 42 44
			10 12 19 25 32 41 45 54
			11 20 24 33 40 46 53 55
			21 23 34 39 47 52 56 61
			22 35 38 48 51 57 60 62
			36 37 49 50 58 59 63 64];
	%ZigZag
    maskMat = zigzag <= DCTch;
    
	retMat = dctmtx(dim);
    %outFrame = blkproc(dctFreq,[dim dim], 'idct2');
	outFrame = blkproc(dctFreq, [dim dim], 'P1*(x.*P2)*P3', retMat',maskMat, retMat);%restruct compressed pic
	outFrame = uint8(outFrame);
end
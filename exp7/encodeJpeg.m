function outFrame = encodeJpeg(dctFreq ,scale, dim)
%encodeJpeg - Description
%
% Syntax: outFrame = encodeJpeg(frame)
%
% Long description
    QuanTable = [16 11 10 16 24 40 51 61
                12 12 14 19 26 58 60 55
                14 13 16 24 40 57 69 56
                14 17 22 29 51 87 80 62
                18 22 37 56 68 109 103 77
                24 35 55 64 81 104 113 92
                49 64 78 87 103 121 120 101
                72 92 95 98 112 100 103 99]; % Luminance quantization table

    %retMat = dctmtx(dim);
    quantValue = blkproc(dctFreq,[dim dim],'round(x./P1)',scale*QuanTable);%quantization
    invQuantValue = blkproc(quantValue,[dim dim], 'x.*P1', scale*QuanTable);%Inverse quantization
    %outFrame = blkproc(invQuantValue,[dim dim],'P1*x*P2',retMat', retMat);
    outFrame = blkproc(invQuantValue,[dim dim],'idct2');
    outFrame = uint8(outFrame);
end
function predFrame = motionComp(refFrame, motionVect, mbSize)
    % Input
    %       refFrame : 
    %       motionVect : MV dx vertical，dy horizontal
    %   	mbSize : MB 
    % Ouput
    %   	predFrame : 
    refSlice = double(refFrame);
    [row, col] = size(refSlice);
    mbCount = 1;
    for i = 1:mbSize:row-mbSize+1
        for j = 1:mbSize:col-mbSize+1
            refBlockRow = i + motionVect(1, mbCount); %start row of the search
            refBlockCol = j + motionVect(2, mbCount); %start col of the search
            predFrame(i:i+mbSize-1,j:j+mbSize-1) = refSlice(refBlockRow:refBlockRow + mbSize -1, refBlockCol:refBlockCol+mbSize-1);
            mbCount = mbCount + 1;
        end
    end
    predFrame = uint8(predFrame);
end
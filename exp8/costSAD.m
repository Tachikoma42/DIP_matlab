function cost = costSAD(currentBlk,refBlk)
    % Input
    %       currentBlk : 
    %       refBlk : 
    %       mbSize : M
    % Output
    %       cost : 
    cost = sum(sum(abs(currentBlk-refBlk)));
end
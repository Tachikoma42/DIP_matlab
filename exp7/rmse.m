function [difference, rmse] = rmse(frame, outFrame)
%rmse - Description
%
% Syntax: [difference, rmse] = rmse(frame, outFrame)
%
% Long description
    [row, col]=size(frame);
    difference =double(frame) - double(outFrame);
    rmse=sqrt(sum(difference(:).^2) / (row * col));
    difference =  (difference);
end

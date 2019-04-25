% function newbuf=Dpcm_code(oldbuf,M,N,dim)
%     global newbuf;
%     %set global variables
%     for i=1:M
%         for j=1:N
%             pre_val=Predict_Value(i,j,N,dim);
%             err=oldbuf(i,j)-pre_val;
%             quan_err=Quant_Value(err);
%             res_val=Restor_Value(quan_err,pre_val);
%             newbuf(i,j)=Clip_Value(res_val);
%         end
%     end 
% end

function [outFrame,qError] = Dpcm_code(frame, dim)
    [row, col] = size(frame);
    slice = double(frame);
    outFrame = zeros(row,col);
    for i = 1:row
        for j = 1:col
            predictVal = Predict_Value(slice, i, j, col, dim);
            predictErr = frame(i,j) -predictVal;
            encodedByQuant = Quant_Value(predictErr);
            qError(i,j) = encodedByQuant;
            restortVal = Restor_Value(encodedByQuant,predictVal);
            outFrame(i, j) = Clip_Value(restortVal);
        end
    end
    outFrame = uint8(outFrame);
end

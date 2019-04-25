% function newbuf=Error_Code(M,N,dim)
%     global newbuf;
%     wrong=zeros(M,N);
%     wrong(100,100)=120;
%     for i=1:M
%         for j=1:N
%             pre_val=Predict_Value(i,j,N,dim);
%             err=wrong(i,j);
%             quan_err=Quant_Value(err);
%             res_val=Restor_Value(quan_err,pre_val);
%             newbuf(i,j)=Clip_Value(res_val);
%         end
%     end 
% end

function outFrame = Error_Code(frame,qError, dim)
    [row, col] = size(frame);
    slice = double(frame);
    outFrame = zeros(row,col);
    qError(100,100)= 255;
    for i = 1:row
        for j = 1:col
            predictVal = Predict_Value(slice, i, j, col, dim);
            predictErr = qError(i,j);
            encodedByQuant = Quant_Value(predictErr);
            restortVal = Restor_Value(encodedByQuant,predictVal);
            outFrame(i, j) = Clip_Value(restortVal);
        end
    end
    outFrame = uint8(outFrame);
end
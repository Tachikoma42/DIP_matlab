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

function outFrame = Error_Code(frame, dim)
    [row, col] = size(frame);
    slice = double(frame);
    outFrame = zeros(row,col);
    for i = 1:row
        for j = 1:col
            predictVal = Predict_Value(slice, i, j, col, dim);
            predictErr = frame(i,j) -predictVal;
            if i==10
                predictErr = 128;
            end
            if j == 10
                predictErr = 128;
            end
            encodedByQuant = Quant_Value(predictErr);
            restortVal = Restor_Value(encodedByQuant,predictVal);
            outFrame(i, j) = Clip_Value(restortVal);
        end
    end
    outFrame = uint8(outFrame);
end
function newbuf=Dpcm_code(oldbuf,M,N,dim)
    global newbuf;
                                    %定义全局变量
    for i=1:M
        for j=1:N
            pre_val=Predict_Value(i,j,N,dim);
            err=oldbuf(i,j)-pre_val;
            quan_err=Quant_Value(err);         
            res_val=Restor_Value(quan_err,pre_val);
            newbuf(i,j)=Clip_Value(res_val);
        end
    end 
end
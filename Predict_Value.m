function  Pvalue=Predict_Value(row,col,N,dim) 
    global newbuf; 
    switch  dim
        case 1
            if col==1
                Pvalue=128;
            else
                Pvalue=newbuf(row,col-1);
            end 
        case 2     
            if (row==1&&col==1)
                Pvalue=128;
            end         
            if (row==1&&col>1)
                Pvalue=newbuf(row,col-1);         
            end         
            if (row>1&&col==1)||(row>1&&col==N)             
                Pvalue=newbuf(row-1,col);         
            end         
            if (row>1&&col>1&&col<N)            
                Pvalue=(1/2)*newbuf(row,col-1)+(1/4)*newbuf(row-1,col-1)+(1/4)*newbuf(row-1,col+1);
            end
    end 
end

function predictVal = Predict_Value(slice, row, col, totalCol, dim)
	switch  dim
	case 1
		if col==1
			predictVal=128;
		else
			predictVal=slice(row,col-1);
		end
	case 2
		if (row==1&&col==1)
			predictVal=128;
		end 
		if (row==1&&col>1)
			predictVal=slice(row,col-1);
		end
		if (row>1&&col==1)||(row>1&&col==totalCol)
			predictVal=slice(row-1,col);
		end
		if (row>1&&col>1&&col<totalCol)
			predictVal=(1/2)*slice(row,col-1)+(1/8)*slice(row-1,col-1)+(1/4)*slice(row-1,col	)+(1/8)*slice(row-1,col+1);
		end
end 
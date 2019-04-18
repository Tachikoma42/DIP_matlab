function Cvalue=Clip_Value(res_val)
	if (res_val<0)
		Cvalue=0;
	elseif(res_val>255)  
		Cvalue=255;       
	else
		Cvalue=res_val;       
	end
end
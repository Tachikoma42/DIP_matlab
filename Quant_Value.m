function Qvalue=Quant_Value(err)
	if (abs(err)<=2.5) 
		lev=0;   
	elseif(abs(err)<=7.5)
        lev=5;         
    elseif(abs(err)<=13.5)
		lev=10;
    elseif(abs(err)<=22.5)
		lev=17;			
    elseif(abs(err)<=33.5)   
		lev=28;
    elseif(abs(err)<=45.5)   
		lev=39;
    elseif(abs(err)<=59.5)
		lev=52;
    else
		lev=67;
	end
	Qvalue=lev; 
	if (err~=0)
		Qvalue=lev*(err/abs(err));
	end
end
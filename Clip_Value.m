function retVal=Clip_Value(restortVal)
	if (restortVal<0)
		retVal=0;
	elseif(restortVal>255)
		retVal=255;
	else
		retVal=restortVal;
	end
end
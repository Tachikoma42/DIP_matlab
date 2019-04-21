% function Qvalue=Quant_Value(err)
% 	if (abs(err)<=2.5) 
% 		lev=0;   
% 	elseif(abs(err)<=7.5)
%         lev=5;         
%     elseif(abs(err)<=13.5)
% 		lev=10;
%     elseif(abs(err)<=22.5)
% 		lev=17;			
%     elseif(abs(err)<=33.5)   
% 		lev=28;
%     elseif(abs(err)<=45.5)   
% 		lev=39;
%     elseif(abs(err)<=59.5)
% 		lev=52;
%     else
% 		lev=67;
% 	end
% 	Qvalue=lev; 
% 	if (err~=0)
% 		Qvalue=lev*(err/abs(err));
% 	end
% end

function encodedByQuant = Quant_Value(predictErr)
	if (abs(predictErr)<=2.5) 
		quant=0;   
	elseif(abs(predictErr)<=7.5)
		quant=5;         
	elseif(abs(predictErr)<=13.5)
		quant=10;
	elseif(abs(predictErr)<=22.5)
		quant=17;			
	elseif(abs(predictErr)<=33.5)   
		quant=28;
	elseif(abs(predictErr)<=45.5)   
		quant=39;
	elseif(abs(predictErr)<=59.5)
		quant=52;
	else
		quant=67;
	end
	encodedByQuant = quant; 
	if (predictErr ~= 0)
		encodedByQuant=quant*(predictErr/abs(predictErr));
	end
end
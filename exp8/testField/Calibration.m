function cal=Calibration(F) 
    F=double(F);
    [M,N]=size(F);
    m1=min(min(F));
    for x=1:M     
        for y=1:N         
            fm(x,y)=F(x,y)-m1;
        end 
    end 
    m2=max(max(fm));
    Fm=double(fm);
    for x=1:M     
        for y=1:N        
            fs(x,y)=255*(Fm(x,y)/m2);
        end 
    end 
    cal=uint8(fs);
end
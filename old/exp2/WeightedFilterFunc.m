function new =WeightedFilterFunc(f)
    %????????????????????????
    %??????1???
    a = [1 2 1;2 4 2;1 2 1];
    [row, col]=size(f);   
    x1=double(f);
    x2=x1;
    n = 3;
    
    for i=2:row-n+1
        for j=2:col-n+1
            c = x1(i:i+(n-1),j:j+(n-1)).*a; %??x1??(i,j)???n?n????????
            s = sum(sum(c));                 %?c????????
            x2(i+(n-1)/2,j+(n-1)/2)=s/16; %?????????????????????????
        end
    end
    %???????
    new  =uint8(x2);
end

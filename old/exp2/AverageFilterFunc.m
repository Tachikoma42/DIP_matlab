function output=AverageFilterFunc(x,n)   
    a(1:n,1:n)=1;%  
    [row, col]=size(x);   
    x1=double(x);
    x2=x1;
    for i=1:row-n+1
        for j=1:col-n+1
            c=x1(i:i+(n-1),j:j+(n-1)).*a; 
            s=sum(sum(c));                 
            x2(i+(n-1)/2,j+(n-1)/2)=s/(n*n); 
        end
    end
    output=uint8(x2);
end
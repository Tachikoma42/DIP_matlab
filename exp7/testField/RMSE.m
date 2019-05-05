%5. RMSE.m 
function rmse=RMSE(oldbuf) 
    %求均方根误差
    [M,N]=size(oldbuf);
    e=oldbuf.^2;
    rmse=sqrt(sum(e(:))/(M*N));
end 
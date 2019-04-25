%2. BtcBlock.m
function outbuf=BtcBlock(inbuf,n)
    %btc 方块编码算法函数 
    %inbuf 子块数组 
    %n 方块尺寸 
    %对每个子块的图像数据分别计算xt、a0、a1值，
    %再用分辨率分量 %(a0,a1)替代方块原来的数据，
    %最后放入方块图像数组中并返回该数组 
    inbuf=double(inbuf);
    temp=0; %总的像素值 
    temp0=0; %小于阀值的总像素
    temp1=0;%大于阀值的总像素 
    q=0; %大于阀值的像素的个数 
    m=n*n;
    for i=1:n
        for j=1:n
            temp=temp+inbuf(i,j);
        end
    end
    xt=temp/m; %平均像素值即阀值
    for i=1:n 
        for j=1:n
            if inbuf(i,j)<xt 
                temp0=temp0+inbuf(i,j);%得出小于阀值的总像素 
            else
                temp1=temp1+inbuf(i,j); %得出大于阀值的总像素
                q=q+1; %大于阀值的像素个数
            end
        end
    end
    if q~=m
        a0=uint8(temp0/(m-q)); %得出小于阀值的像素值
    end 
    if q~=0
        a1=uint8(temp1/q); %得出大于阀值的像素值
    end
    for i=1:n
        for j=1:n
            if inbuf(i,j)<xt
                outbuf(i,j)=a0;
            else
                outbuf(i,j)=a1;
            end
        end 
    end 
end

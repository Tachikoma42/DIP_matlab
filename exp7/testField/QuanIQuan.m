function [newbuf,e,rmse2]=QuanIQuan(oldbuf,dctfre,n,scale) 
    %量化和反量化函数：根据给定的默认JPEG量化表， %对每个n×n块的DCT系数进行量化和反量化，显示量化误差图像及其直方图。 
    %oldbuf:原始图像数据 
    %dctfre:DCT系数矩阵 
    %n:分块的大小 
    %scale; 量化系数 
    z= [16 11 10 16  24  40  51  61
        12 12 14 19  26  58  60  55
        14 13 16 24  40  57  69  56
        14 17 22 29  51  87  80  62
        18 22 37 56  68 109 103  77
        24 35 55 64  81 104 113  92
        49 64 78 87 103 121 120 101
        72 92 95 98 112 100 103  99
        ];%默认JPEG量化表 
    Qvalue=blkproc(dctfre,[n n],'round(x./P1)',scale*z);%量化  
    IQvalue=blkproc(Qvalue,[n n],'x.*P1',scale*z);%反量化  
    %对经过量化和反量化后的矩阵进行逆DCT变换得到重建图像矩阵  
    D=dctmtx(n);
    newbuf=blkproc(IQvalue,[n n],'P1*x*P2',D',D);
    e=newbuf-oldbuf;%e为量化误差矩阵  
    rmse2=RMSE(e);%求均方根误差  
    newbuf=newbuf+128;
end 

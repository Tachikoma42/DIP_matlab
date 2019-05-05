function dctfre = DctBlock(oldbuf,n)  
    %分块DCT函数：根据给定的n值，计算原图像的n×n块的DCT系数，并转换为可视频谱图以便 观察  
    % oldbuf 原始图像数据   
    %n 分块的大小   
    %dctfre DCT系数矩阵 
    D=dctmtx(n);%D是返回N×N的DCT变换矩阵，矩阵A的DCT变换可用D×A×D’来计算 
    dctfre=blkproc(oldbuf,[n,n],'P1*x*P2',D,D');%D'为D的转置 
end 
% 2. ZigIDCT.m 
function [I,e,rmse1]=ZigIDCT(oldbuf,dctfre,DCTch,n) 
    %oldbuf:原始图�?数�?� 
    %dctfre:DCT系数矩阵 
    %DCTch:�?个分�?�中需�?�?留的DCT系数个数 
    %n:分�?�的大�? 
    %e:原图�?与�?留部分DCT系数�?�的�?建图�?之间的误差矩阵 
    % 按Zig-Zag扫�??顺�?，根�?�DCTch�?�数，�?��?留64个 
    % DCT系数中的�?DCTch个系数，对修改�?�的DCT系数用逆DCT�?��?��?建图�?，得到DCT�?� 
    % �?�的压缩图�?。计算�?建图�?的�?�方根误差RMSE ；显示误差图�?和误差直方图。 
zigzag = [
    01 02 06 07 15 16 28 29
    03 05  08 14 17 27 30 43
    04 09 13 18 26 31 42 44
    10 12 19 25 32 41 45 54
    11 20 24 33 40 46 53 55
    21 23 34 39 47 52 56 61
    22 35 38 48 51 57 60 62
    36 37 49 50 58 59 63 64
    ];%设置z扫�??顺�?
    maskbuf=zigzag<=DCTch;
    %根�?�当�?DCTch值得到“Z�?字扫�??的逻辑值,mask为logic类型 
    %对修改�?�的DCT系数用逆DCT�?��?��?建图�?，得到DCT�?��?�的压缩图�? 
    D=dctmtx(n);
    I=blkproc(dctfre,[n n],'P1*(x.*P2)*P3',D',maskbuf,D);
    %I为�?建的压缩图�? 矩阵 
    e=oldbuf-I;
    %e:原图�?与�?留部分DCT系数�?�的�?建图�?之间的误差矩阵 
    I=I+128;
    rmse1=RMSE(e);
end 

function [ result ] = Normalize(original)
    
    [row, col] = size(original);
    NormOri = zeros(row, col);
    %NormOri = original;
    for i = 1: row
        for j = 1: col
            NormOri(i,j) = original(i,j);
        end
    end
    vect1 = zeros(1,256);% preallocated memory
    vect2 = zeros(1,256);% preallocated memory
    NormOri = double(NormOri);
    for i = 1 : row
        for j = 1 : col
            vect1(NormOri(i,j)+1) = vect1(NormOri(i,j)+1)+1; % ????????
        end
    end
    %??
    for i = 1 : 256
        tem = 0;
        for j = 1 : i
            tem = tem + vect1(j);
        end
        vect2(i) = floor(tem*255/(row*col));
    end
    %????
    result = zeros(row, col); %preallocate result
    for i = 1 : row
        for j = 1: col
            result(i,j) = vect2(NormOri(i,j)+1);
        end
    end
    result = uint8(result);
end
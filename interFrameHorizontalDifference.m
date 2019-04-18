function  result =interFrameHorizontalDifference(frame)
    %function: find the horizontal difference in one frame
    %input:frame
    %output: Laplace distribution of the difference

    slice = frame;

    slice = double(slice);
    [row,col] = size(slice);
    result = zeros(1,2*255+1);
    for i = 1:row-1
        for j = 1:col %to prevent index out of bounds
            temp = slice(i,j) - slice(i+1,j);
            result(temp+256) = result(temp+256)+1;
        end
    end
end
function  result =betweenFrameDifference(frame1, frame2)
    %function: find the vertical difference in one frame
    %input:frame
    %output: Laplace distribution of the difference
    %
    slice1 = frame1;
    slice2 = frame2;
    slice1 = double(slice1);
    slice2 = double(slice2);

    [row,col] = size(slice1);
    result = zeros(1,2*255+1);
    for i = 1:row
        for j = 1:col 
            temp = slice1(i,j) - slice2(i,j);
            result(temp+256) = result(temp+256)+1;
        end
    end
end
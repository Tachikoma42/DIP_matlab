f = imread('lenna_noise.tif');
figure();
imshow(f);
%f = mat2gray(f, [0 255]);
for i = 1:786432
    if f(i) < 50
        temp = 20 / 50 * f(i);
        f(i) = temp;
    elseif f(i) < 80
        temp = 120/30 *(f(i)-50)+20;
        f(i) = temp;
    else
        temp = 115/175*(f(i)-80)+140;
        f(i) = temp;
    end
end
figure();
imshow(f);

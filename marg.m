grayImage=imread('C:\Users\xkzmx\Documents\Code\Matlab\DIP\test\blurry_moon.tif');
 
%分别使用Roberts\Sobel\Prewitt\Canny算�?进行边缘检测
imageRoberts=edge(grayImage,'roberts');
imageSobel=edge(grayImage,'sobel');
imagePrewitt=edge(grayImage,'prewitt');
imageCanny=edge(grayImage,'canny');
 
%显示检测图�?
subplot(2,3,1);
imshow(grayImage,[]);
title('原图�?');
 
subplot(2,3,2);
imshow(imageRoberts,[]);
title('roberts');
 
subplot(2,3,3);
imshow(imageSobel,[]);
title('sobel');
 
subplot(2,3,4);
imshow(imagePrewitt,[]);
title('prewitt');
 
subplot(2,3,5);
imshow(imageCanny,[]);
title('canny');

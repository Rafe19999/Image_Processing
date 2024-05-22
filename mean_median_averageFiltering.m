clc,
clear all;

img=imread("images/cameraman.tif")
Median=medfilt2(img);

subplot(2,2,1)
imshow(img);
title("Original Image");

subplot(2,2,2)
imshow(Median);
title("After using Median Filter");

minf=@(x) min(x(:));
maxf=@(x) max(x(:));
min_Image=nlfilter(img,[3 3],minf);
max_Image=nlfilter(img,[3 3],maxf);

subplot(2,2,3)
imshow(min_Image);
title("Min filter Image");

subplot(2,2,4)
imshow(max_Image);
title("Max Filter Image");
  
  

%Log Transformation s=c *log (1+r)

clc;
clear all;
close all;

img=imread("cameraman.tif");

subplot(2,2,1)
imshow(img);
title("gray image");

subplot(2,2,2)
B=im2double(img);
imshow(B);
title("conveting to 0-1");


[row,column]=size(B);
for i=1:row
   for  j=1:column
         s(i,j)=1*log(1+B(i,j));
   end
end
 subplot(2,2,3)
 imshow(s);
 title("after log transformation");
    
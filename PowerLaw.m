%Power Law Transformation

clc;
clear all;
close all;

img=imread("images/Tulips.jpg");

subplot(2,2,1)
imshow(img);
title("gray image");

subplot(2,2,2)
B=im2double(img); %used to convert the decimal Pixel value to 0-1
imshow(B);
title("conveting to 0-1");



Row=size(img,1);  %we can use this Row ,column method if the image is 3 dimentional 
column=size(img,2);
for i=1:Row
   for  j=1:column
         s(i,j)=(B(i,j)^0.6);
   end
end
 subplot(2,2,3)
 imshow(s);
 title("after Power Law transformation");
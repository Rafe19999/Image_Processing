% color image

clc;
clear all;
close all;
Img = imread("images/Tulips.jpg");
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

subplot(2,2,1)
imshow(R);
title(" R")

subplot(2,2,2)
imshow(G);
title(" G")

subplot(2,2,3)
imshow(B);
title(" B")

subplot(2,2,4)
imshow(Img)
title("Original Image");



    
    
    
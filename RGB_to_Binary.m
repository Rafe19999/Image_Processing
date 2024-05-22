clc;
clear all;

img=imread("Tulips.jpg");

subplot(2,2,1)
imshow(img);
title("RGB image");

G=rgb2gray(img);

subplot(2,2,2)
imshow(G);
title("Gray Image");


B=im2bw(G);

subplot(2,2,3)
imshow(B);
title("Binary Image");
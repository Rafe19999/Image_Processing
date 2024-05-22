clc; clear all;close all;

I= imread('cameraman.tif');


b=imnoise(I,'gaussian');    %add gaussian noise

b1=imnoise(I,'salt & pepper',0.02);   %add salt & pepper noise



subplot(3,3,1)
imshow(I)
title('Original Image')


subplot(3,3,2)
imshow(b)
title('Noisy Image using gaussian noise')

subplot(3,3,3)
imshow(b1)
title('Noisy Image using salt & pepper noise')

subplot(3,3,4)
imhist(I)
title("Original Photo hist");


subplot(3,3,5)
imhist(b)
title("gussian noise hist");

subplot(3,3,6)
imhist(b1)
title("salt & pepper noise hist");


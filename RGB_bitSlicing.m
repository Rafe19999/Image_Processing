clc;
clear all;

img=imread("images/Tulips.jpg")
imag=rgb2gray(img)
imag=double(imag)

        img1=bitget(imag,1)
        img2=bitand(imag,2)
        img3=bitand(imag,4)
        img4=bitand(imag,8)
        img5=bitand(imag,16)
        img6=bitand(imag,32)
        img7=bitand(imag,64)
        img8=bitand(imag,128)
 

figure,
subplot(2,2,1)
imshow(img);
title("Original image")

figure,
subplot(2,2,1)
imshow(img1)
title("slicing image-1")

subplot(2,2,2)
imshow(img2)
title("slicing image-2")

subplot(2,2,3)
imshow(img3)
title("slicing image-3")

subplot(2,2,4)
imshow(img4)
title("slicing image-4")

figure,
subplot(2,2,1)
imshow(img5)
title("slicing image-5")

subplot(2,2,2)
imshow(img6)
title("slicing image-6")

subplot(2,2,3)
imshow(img7)
title("slicing image-7")

subplot(2,2,4)
imshow(img8)
title("slicing image-8")
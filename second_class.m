clc;
clear all;

img=imread("images/cameraman.tif")

BW=im2bw(img)

subplot(2,2,1)
imshow(img);
title("Original Gray Image")

subplot(2,2,2)
imshow(BW);
title("with Default function")
for i=1:256
    for j=1:256
        
       if (img(i,j)>=128)
           B(i,j)=1;
       
       else
           B(i,j)=0;
          
       end
    end
end
subplot(2,2,3)
imshow(B);
title("Without Default Function")

           
       
           
           
           

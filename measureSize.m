%measuring row and columb of an image
clc;
clear all;

img=imread("cameraman.tif");

[row,column]=size(img);
%for finding single use purpose
Row=size(img,1);

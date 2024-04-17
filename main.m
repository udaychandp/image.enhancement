close all;
clear;

addpath('ours','IQA');

Img = imread('1.jpg');
% figure,imshow(Img),title('The original image');
figure,subplot(221),imshow(Img),title("The original image");


fusion = our(Img);
subplot(224),imshow(fusion),title("final output image");
figure,imshow(fusion),title('final output image');


Brisque = brisque(fusion);  
CEIQ = ceiq(fusion);        
ENIQA = eniqa(fusion);      
NIQE = niqe(fusion);         
% PIQE = piqe(fusion);         





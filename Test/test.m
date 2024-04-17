close all;
clear;

img = imread('1.jpg');
% figure,imshow(img),title('The original image');
% figure,imhist(img),title('Original image histogram');
 figure,imshow(img),title('The original image');
 figure,imhist(img),title('Original image histogram');
CEIQ = ceiq(img);
ENIQA = eniqa(img);
Brisque = brisque(img);

Dong = dong(img);
% figure,imhist(Dong),title('Histogram of results from Dong et al.');
figure,imhist(Dong),title('Histogram of results from Dong et al.');
Dong_CEIQ = ceiq(Dong);
Dong_ENIQA = eniqa(Dong);
Dong_brisque = brisque(Dong);

Fu = multi_fusion(img);
figure,imshow(Fu),title("The results of Fu file.");
% figure,imhist(Fu),title('The results of Fu file');
figure,imhist(Fu),title('The results of Fu file');
Fu_CEIQ = ceiq(Fu);
Fu_ENIQA = eniqa(Fu);
Fu_brisque = brisque(Fu);

Guo = lime(img);
% figure,imhist(Guo),title('Histogram of results from Guo file.');
figure,imhist(Guo),title('Histogram of results from Guo file.');
Guo_CEIQ = ceiq(Guo);
Guo_ENIQA = eniqa(Guo);
Guo_brisque = brisque(Guo);

Ying = ying(img);
% figure,imhist(Ying),title('Histogram of results from Ying file.');
figure,imhist(Ying),title('Histogram of results from Ying file.');
Ying_CEIQ = ceiq(Ying);
Ying_ENIQA = eniqa(Ying);
Ying_brisque = brisque(Ying);

ours = our(img);
% figure,imhist(ours),title('histogram of our results');
ours_CEIQ = ceiq(ours);
ours_ENIQA = eniqa(ours);
ours_brisque = brisque(ours);

figure,imshow([Dong,Fu,Guo,Ying,ours]),
% figure,imshow([Dong,Fu,Guo,Ying,ours]),
% title('Dong         Fu            Guo           Ying           Our');
title('Dong file        Fu file           Guo file          Ying file          Our file');
function g = gaussianPyramid(Img,level)
%Gaussian Pyramid
%Parameters: Img: image to be processed, level: number of pyramid levels
g = cell(level,1);
N = 1;
g{N} = Img;
h = fspecial('gaussian',5);
for N = 2:level
    temp = imfilter(g{N-1},h,'conv','same','replicate');%Gaussian filter
    g{N} = temp(1:2:end,1:2:end,:);%Downsampling, sampling in alternate rows and columns
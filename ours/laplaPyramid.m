function lapla = laplaPyramid(Img,level)
%Laplace Pyramid

% decomposed into Gaussian pyramid
gau = cell(level,1);
N = 1;
gau{1} = Img;
h = fspecial('gaussian',5);
for N = 2:level
    temp = imfilter(gau{N-1},h,'conv','same','replicate'); %Gaussian filter
    gau{N} = temp(1:2:end,1:2:end,:); % Downsampling, sampling in alternate rows and columns
end

%Made Laplacian pyramid from Gaussian pyramid
lapla = cell(level,1);
lapla{level} = gau{level};
h = fspecial('gaussian');
for i = level-1:-1:1
    t = imresize(gau{i+1},2,'bilinear');       % upsampling, interpolation
    %t = imfilter(t,h,'conv','same','replicate'); %Gaussian filter
    t = t(1:size(gau{i},1),1:size(gau{i},2));  %Uniform number of rows and columns
    lapla{i} =  gau{i} - t;
end
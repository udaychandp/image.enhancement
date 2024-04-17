function fusion = our(Img)

%Sharpen the image
input1 = imsharp(Img);
subplot(222),imshow(input1,[]),title("Sharpen image");

%Adjust the brightness of the image
input2 = lumina_adjust(Img);
subplot(223),imshow(input2,[]),title("Brightness adjustment image");

%Three weights for sharpened and gamma transformed images
w = Laplacian_weight(input1);
ws = saliency_detection(input1);
wsa = Saturation_weight(input1);
w2 = Laplacian_weight(input2);
ws2 = saliency_detection(input2);
wsa2 = Saturation_weight(input2);
%Normalize the two sets of weights respectively
weight1 = (w+ws+wsa+0.1)./(w+ws+wsa+w2+ws2+wsa2+0.2);
weight2 = (w2+ws2+wsa2+0.1)./(w+ws+wsa+w2+ws2+wsa2+0.2);

% Decompose the normalized weight map into a Gaussian pyramid and the sharpened and brightness adjusted image into a Laplacian pyramid
n = 10;
g1 = gaussianPyramid(weight1,n);
g2 = gaussianPyramid(weight2,n);
l1 = laplaPyramid(input1,n);
l2 = laplaPyramid(input2,n);

% Fusion of weighted Gaussian pyramid and Laplacian pyramid into a new pyramid
r = cell(n,1);
for i = 1:n
    r{i} = g1{i}.*im2double(l1{i}) + g2{i}.*im2double(l2{i});
end
%Integrate the new pyramid
for i = n:-1:2
    t = imresize(r{i},2,'bilinear');           % interpolation
    t = t(1:size(r{i-1},1),1:size(r{i-1},2));  % unify the number of rows and columns
    r{i-1} = t + r{i-1}; 
end
fusion = r{1};

%Convert the processed image into the original image format
c = class(Img);
switch c
case 'uint8'
   fusion = im2uint8(fusion);
case 'uint16'
   fusion = im2uint16(fusion);
case 'double'
   fusion = im2double(fusion);
otherwise
   error('Data types not supported by Image Processing Toolbox');
end




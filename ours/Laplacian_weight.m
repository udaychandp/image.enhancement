function WL = Laplacian_weight(Img)
% Laplacian contrast weight

%Extract bright channel
h = rgb2hsv(Img);
l = double(h(:,:,3));
% Laplacian filter
w = [0,1,0;1,-4,1;0,1,0];
WL = imfilter(l,w,'replicate');
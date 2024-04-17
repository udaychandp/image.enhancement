function wsa = Saturation_weight(Img)
% saturation weight
r=double(Img(:,:,1));
g=double(Img(:,:,2));
b=double(Img(:,:,3));
%Extract the value of the bright channel
h = rgb2hsv(Img);
l = double(h(:,:,3));
wsa = (1/3*((r-l).^2+(g-l).^2+(b-l).^2)).^(1/2);
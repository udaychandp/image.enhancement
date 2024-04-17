function sm = saliency_detection(img)
%Significance weight
%---------------------------------------------------------
% % Read the image and blur it using a 3x3 or 5x5 Gaussian filter
%---------------------------------------------------------
%img = imread('input_image.jpg');%Provide input image path
gfrgb = imfilter(img, fspecial('gaussian', 3, 3), 'symmetric', 'conv');
%---------------------------------------------------------
% Perform sRGB to CIE Lab color space conversion (using D65)
%---------------------------------------------------------
%cform = makecform('srgb2lab', 'whitepoint', whitepoint('d65'));
cform = makecform('srgb2lab');
lab = applycform(gfrgb,cform);
%---------------------------------------------------------
% Calculate Lab average
% (note that in the paper this average is found from the unblurred original image, but the results are very similar)
%---------------------------------------------------------
l = double(lab(:,:,1)); lm = mean(mean(l));
a = double(lab(:,:,2)); am = mean(mean(a));
b = double(lab(:,:,3)); bm = mean(mean(b));
%---------------------------------------------------------
% Finally calculate the saliency map and display it.
%---------------------------------------------------------
sm = (l-lm).^2 + (a-am).^2 + (b-bm).^2;
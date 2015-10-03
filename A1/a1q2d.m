% Assignment 1, question 2 d: convolve 'image.jpg' with a gaussian filter and sigma = 10

% create gaussian filter
f10 = fspecial('gaussian', [15 15], 10);

% read and grey image
im = imread('image.jpg');
img = rgb2gray(im);

% using conv2() required doubles, and when using double() the image showed a blank square
convolved = imfilter(im, f10, 'conv');
% imshow(convolved);

imwrite(convolved, 'a1q2d.png');
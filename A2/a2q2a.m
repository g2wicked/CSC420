% SIFT features for reference.png and test.png
addpath('./sift');
% read images and grayscale
imRef = imread('reference.png');
imgRef = rgb2gray(imRef);
imTest = imread('test.png');
imgTest = rgb2gray(imTest);

% get frames and descriptors for images
[fRef, dRef, lRef] = sift(double(imgRef/256));
[fTest, dTest, lTest] = sift(double(imgTest/256));

% Plot images
imshow(imRef);
hold on;
sfRef = plotsiftframe(fRef(:,1:100));
set(sfRef,'color','r','linewidth',1);

imshow(imTest);
hold on;
sfRef = plotsiftframe(fTest(:,1:100));
set(sfRef,'color','y','linewidth',1) ;

% SIFT features for reference.png and test.png
function out = a2q2a(useIm2)
addpath('./sift');
% read images and grayscale
imRef = imread('reference.png');
imgRef = rgb2gray(imRef);
imTest = imread('test.png');
imgTest = rgb2gray(imTest);

% get frames and descriptors for images
if(useIm2 == true)
[fRef, dRef, lRef] = sift(im2double(imgRef));
[fTest, dTest, lTest] = sift(im2double(imgTest));
else
[fRef, dRef, lRef] = sift(double(imgRef/256));
[fTest, dTest, lTest] = sift(double(imgTest/256));
end

% Plot images
imshow(imRef);
hold on;
sfRef = plotsiftframe(fRef(:,1:100));
set(sfRef,'color','r','linewidth',1);

imshow(imTest);
hold on;
sfRef = plotsiftframe(fTest(:,1:100));
set(sfRef,'color','y','linewidth',1) ;
end
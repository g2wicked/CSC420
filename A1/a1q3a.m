% Compute magnitude of gradients for 'waldo.png' and 'template.png'

function out = a1q3a(filename)
% read image
im = imread(filename);

% grayscale
img = rgb2gray(im);

% gradient
g = imgradient(img);

% take max of max for 2D and because sometimes, the values are too small
waldoMaxGradient = g/max(max(g));

out = waldoMaxGradient;
% imshow(waldoMaxGradient);
imwrite(waldoMaxGradient, 'a1q3a.png');

end
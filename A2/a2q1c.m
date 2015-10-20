% Lowe's scale-invariant interest point detection
function out = a2q1c.m(filename, scale, sigma)
% read image and grayscale
im = imread(filename);
img = rgb2gray(im);

octaves = x;

% Create a Gaussian pyramid with s blurring levels per octave
g = fspecial('gaussian', [], sigma)

imgPyramid = [] % will be array of arrays of images

for i = 1:octaves
    for j = 1: scale
        if i == 1 && j == 1
            % filter and store
            image = imfilter(img, g, 'conv');
            imgPyramid(i, j) = image;
        else
            % filter
            image = imfilter(imgPyramid(i - 1), g, 'conv');
            % scale image down
            newImage = % some scaling function;
            % store
            imgPyramid(i, j) = newImage;
        end
    end
end

% compute difference between consecutive levels
% D(x, y, p) = I(x, y) * (G(x, y, p) - G(x, y, p))
% for p = {sigma, k*sigma, k^(2)*sigma, ..., k^(s-1)*sigma}, k = 2^(1/s)

% Find local extrema in space and scale


end
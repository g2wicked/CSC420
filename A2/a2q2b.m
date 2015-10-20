% SIFT features for reference.png and test.png
function out = a2q2b(useIm2)
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

% find matches
d = dist2(dRef.', dTest.');
[n, m] = size(d);
thresh = 0.8;

% calculate ratios and closest matches
[d_sorted, d_index] = sort(d, 2);
for i = 1:n
    v_closest = d_index(i,1);
    v_second = d_index(i,2);
    ratio = d_sorted(i,1)./d_sorted(i,2);
    if ratio < thresh
        matches(i) = v_closest;
        ratios(i) = ratio;
    else
        matches(i) = 0;
        ratios(i) = Inf; % large number - we will be looking at minimums anyway
    end
end

% get top 3 correspondences by choosing matches with lowest ratio
[r_sorted, r_index] = sort(ratios);
index = 1;
top = [];
for index = 1:3
    ind = r_index(1, index);
    top(ind) = matches(ind);
end

indices = find(top > 0);

% Plot images
imshow(imRef);
hold on;
mr1 = plotsiftframe(fRef(:, indices(1):indices(1)));
set(mr1,'color','r','linewidth',1) ;
mr2 = plotsiftframe(fRef(:, indices(2):indices(2)));
set(mr2,'color','g','linewidth',1) ;
mr3 = plotsiftframe(fRef(:, indices(3):indices(3)));
set(mr3,'color','b','linewidth',1) ;
hold off;

imshow(imTest);
hold on;
mt1 = plotsiftframe(fTest(:, top(indices(1)):top(indices(1))));
set(mt1,'color','r','linewidth',1) ;
mt2 = plotsiftframe(fTest(:, top(indices(2)):top(indices(2))));
set(mt2,'color','g','linewidth',1) ;
mt3 = plotsiftframe(fTest(:, top(indices(3)):top(indices(3))));
set(mt3,'color','b','linewidth',1) ;
hold off;

% Return map with frames and key feature indices
out = containers.Map({'fRef', 'fTest', 'rInd', 'tInd'}, {fRef, fTest, [indices(1), indices(2), indices(3)],[top(indices(1)), top(indices(2)), top(indices(3))]})
end
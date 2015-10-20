% Visualise affine
function out = a2q2d(useIm2)
% read and grayscale image
imRef = imread('reference.png');
imTest = imread('test.png');
[h, w, ~] = size(imRef);

% Ax = B
A = [1, 1, 0, 0, 1, 0; 0, 0, 1, 1, 0, 1;
1, h, 0, 0, 1, 0; 0, 0, 1, h, 0, 1;
w, 1, 0, 0, 1, 0; 0, 0, w, 1, 0, 1;
w, h, 0, 0, 1, 0; 0, 0, w, h, 0, 1;]

% affine transformation
transMat = a2q2c(useIm2);
B = A*transMat;

% Plot lines for dvd
imshow(imTest);
hold on;
line([B(1), B(3)],[B(2),B(4)],'Color','r', 'Linewidth', 2);
line([B(1), B(5)],[B(2),B(6)],'Color','r', 'Linewidth', 2);
line([B(3), B(7)],[B(4),B(8)],'Color','r', 'Linewidth', 2);
line([B(5), B(7)],[B(6),B(8)],'Color','r', 'Linewidth', 2);
hold off;
end
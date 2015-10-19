% Visualise affine
imRef = imread('reference.png');
imTest = imread('test.png');
imgRef = rgb2gray(imRef);
[h, w] = size(imgRef);

% Ax = B
A = [1, 1, 0, 0, 1, 0; 0, 0, 1, 1, 0, 1;
1, h, 0, 0, 1, 0; 0, 0, 1, h, 0, 1;
w, 1, 0, 0, 1, 0; 0, 0, w, 1, 0, 1;
w, h, 0, 0, 1, 0; 0, 0, w, h, 0, 1;]

% affine transformation from double()
transMat = [0.5636; -0.2250; 0.2508; 0.4862; 480.5629; 112.5826];
% affine transformation from im2
% transMat = [0.6051; -0.2355; 0.2353; 0.5377; 476.4099; 98.7497];
B = A*transMat;
imshow(imTest);
hold on;
%12, 34, 56, 78
line([B(1), B(3)],[B(2),B(4)],'Color','r', 'Linewidth', 2);
line([B(1), B(5)],[B(2),B(6)],'Color','r', 'Linewidth', 2);
line([B(3), B(7)],[B(4),B(8)],'Color','r', 'Linewidth', 2);
line([B(5), B(7)],[B(6),B(8)],'Color','r', 'Linewidth', 2);
hold off;
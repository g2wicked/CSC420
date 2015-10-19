% Harris corner detection
function out = a2q1a(filename)
% read image and grayscale
im = imread(filename);
img = rgb2gray(im);

% compute gradients I_x, I_y
[Gx, Gy] = imgradientxy(img);

% Get I_x^2, I_y^2, I_x*I_y
Ix2 = Gx.^2;
Iy2 = Gy.^2;
Ixy = Gx.*Gy;

% Compute M = [Ix2g, Ixyg; Ixyg, Iy2g];
gaussFilt = fspecial('gaussian');
Ix2g = conv2(Ix2, gaussFilt, 'same');
Iy2g = conv2(Iy2, gaussFilt, 'same');
Ixyg = conv2(Ixy, gaussFilt, 'same');

% Compute R = det(M) - alpha*trace(M)^2
alpha = 0.04; % alpha is usually 0.04 to 0.06
Rmax = 0;
[h, w] = size(img);
R = zeros(h, w);

Mdet = Ix2g.*Iy2g - Ixyg.^2; % det(M)
Mtrace = Ix2g + Iy2g; % trace(M) = sum of diag
R = Mdet-alpha*((Mtrace).^2);
Rmax = max(max(R));

% Non-maximum suppression
Res = zeros(h, w);
thresh = Rmax*0.028;
for i = 1:h
	for j = 1:w
		% Keep if px is greater than thresh and surrounding px
		if R(i,j) > thresh
			isLocalMax = true;
			for n = i-1:i+1
				for m = j-1:j+1
					if R(n, m) > R(i, j)
						isLocalMax = false;
						break
					end
				end
				if isLocalMax == false
					break
				end
			end
			if isLocalMax == true
				Res(i,j) = 1;
			end
		end
	end
end

[posc, posr] = find(Res == 1);
imshow(img);
hold on;
plot(posr,posc,'r.');
end
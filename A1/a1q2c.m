function out = a1q2c(sigma)
% 2D Gaussian function from Lecture 2: h(u, v) = (1/(pow(2*pi*sigma, 2)))*pow(e, (-(pow(u, 2) + pow(v, 2))/pow(sigma, 2))
% Note: from other sources, the denominator of e's exponent is actually 2*sigma^2, instead of sigma^2 indicated in lecture

% size of filter, assuming default size from imgaussfilt
s = 2*ceil(2*sigma)+1;
filter = zeros(s, s);

% const 1/(2*pi*sigma^2)
const = 1 / (2 * pi * sigma.^2);

% loop through matrix and add values to create gaussian kernel
centre = round(s./2);
for n = 1:s
	for m = 1:s
		exponent = -((n - centre).^2 + (m - centre).^2) / 2*sigma.^2;
		filter(n, m) = const * exp(exponent);
	end
end

% alternate solution
% [x y] = meshgrid(round(-s/2):round(s/2), round(-s/2):round(s/2));
% out = exp(-x.^2/(2*sigma.^2)-y.^2/(2*sigma.^2));
% out = out./sum(out(:));
out = filter;

end
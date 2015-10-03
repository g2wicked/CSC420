% Script for a1q3b: Localise the template in the waldo image based on the magnitude of gradients

% call a1q3a on both waldo and template to get magnitude of gradients for each, then localise the template by calling a1q3b

im = a1q3a('waldo.png');
filter = a1q3a('template.png');

output = a1q3b(im, filter);
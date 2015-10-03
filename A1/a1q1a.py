import numpy
from pylab import *

# 1a: Compute convolution of a 2D (grayscale) image and a 2D filter
def zeroPad(img, h, w, h_pad, w_pad):
	# zero matrix
	ni_h = h + h_pad
	ni_w = w + w_pad
	new_img = numpy.zeros((ni_h, ni_w), 'uint8')

	# copy image into matrix
	n = 0
	for i in range(h_pad // 2, ni_h - h_pad // 2):
		m = 0
		for j in range(w_pad // 2, ni_w - w_pad // 2):
			new_img[i][j] = img[n][m]
			m = m + 1
		n = n + 1

	return new_img

def flipFilter(f):
	return f[::-1,::-1]

def getPixelValue(padded_img, filter, i, j):
	f_h, f_w = filter.shape
	summed = 0
	for k in range(f_h):
		n_j = j
		for l in range(f_w):
			summed = summed + (filter[k][l] * padded_img[i][n_j])
			n_j = n_j + 1
		i = i + 1
	return summed

def convolution(image, filter):
	# grey
	img_grey = ( image[...,0] + image[...,1] + image[...,2] ) // 3
	
	# get padding
	f_h, f_w = filter.shape
	h, w = img_grey.shape # height, width, channels

	h_pad = f_h - 1
	w_pad = f_w - 1

	padded = zeroPad(img_grey, h, w, h_pad, w_pad)

	# flip filter
	flipped = flipFilter(filter)

	# multiply
	img_copy = img_grey.copy()
	for i in range(h):
		for j in range(w):
			img_copy[i][j] = getPixelValue(padded, flipped, i, j)

	imshow(img_copy)
	gray()
	show()

if __name__ == '__main__':
	print "hi"
	f = numpy.array([[1,1,1],[1,1,1],[1,1,1]])
	print f
	im = imread("image.jpg")
	convolution(im, f)
#! /usr/bin/python

spiralSize = 1001
total = 1
for n in xrange( 3, spiralSize + 1, 2 ) :
	total += 4 * n * n - 6 * n + 6

print total


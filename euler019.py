#! /usr/bin/python

from datetime import date

count = 0
for y in xrange(1901, 2001) :
	for m in xrange( 1, 13 ) :
		if date( y, m, 1 ).weekday() == 6 :
			count += 1

print "\nResult:", count





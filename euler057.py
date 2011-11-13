#! /usr/bin/python

n = 3
d = 2
count = 0
for i in xrange(0,1000) :
	d, n = d + n, d * 2 + n
#	print n,"/",d,"=",1.0*n/d
	if len(str(n)) > len(str(d)) :
		count += 1
print count
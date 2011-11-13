#! /usr/bin/python

def isFakeSimplifiable( n, d ) :
	n1, n2 = divmod( n, 10 )
	d1, d2 = divmod( d, 10 )

	if n2 == d1 and n * d2 == d * n1 :
		print "%d/%d == %d/%d" % ( n, d, n1, d2 )
		return True
	else :
		return False


fractions = [ (n,d) for d in xrange(11,100) for n in xrange(11,d) if isFakeSimplifiable( n, d ) ]


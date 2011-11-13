#! /usr/bin/python

def isLychrel( n ) :
	fwd = n + int(str(n)[::-1])
	for i in xrange(1, 51) :
		rev = int(str(fwd)[::-1])
		if fwd == rev :
			return False
		else :
			fwd += rev
	else :
		return True

print len( 1 for i in xrange(1,10000) if isLychrel(i) )
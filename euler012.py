#! /usr/bin/python

from math import sqrt

def tri( n ) :
	return ( n * ( n + 1 ) ) / 2

def isTri( x ) :
	n = ( -1 + sqrt( 1 + 8 * x ) ) / 2
	return n % 1 == 0

def factorCount( n ) :
	root = sqrt( n )
	
	factors = ( 2 if root % 1 != 0 else 3 )
	
	for i in xrange( int( root ), 2, -1 ):
		if n % i == 0 :
			factors += 2

	return factors

t = 1
i = 1

while True :
	i += 1
	t += i

	if factorCount( t ) > 500 :
		print t
		break


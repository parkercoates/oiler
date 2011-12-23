#! /usr/bin/python

factorials = { 0: 1 }

def fact( n ) :
	if n in factorials :
		return factorials[n]
	else :
		f = n * fact( n - 1 )
		factorials[n] = f
		return f

def nChooseR( n, r ) :
	return fact( n ) / fact( r ) / fact( n - r )

print sum( 1   for i in xrange( 1, 101 )   for j in xrange( 1, i )   if nChooseR( i, j ) > 1000000 )

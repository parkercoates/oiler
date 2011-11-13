#! /usr/bin/python2

def isSumOfFactorialsOfDigits( n ) :
	return n == sum( factorials[ int( d ) ] for d in str(n) )


factorials = [ 1 ]
for i in xrange( 1, 10 ) :
	factorials.append( i * factorials[ -1 ] )

maxDigits = 0
upperLimit = 1
while ( upperLimit ) >= ( 10 ** maxDigits ) :
	maxDigits += 1
	upperLimit += factorials[9]

print sum( n for n in xrange( 3, upperLimit ) if isSumOfFactorialsOfDigits( n ) )

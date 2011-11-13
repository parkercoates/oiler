#! /usr/bin/python

power = 5

maxDigits = 1
while ( maxDigits * 9 ** power ) >= ( 10 ** maxDigits - 1 ) :
	maxDigits += 1

print sum( n for n in xrange( 2, 10 ** maxDigits ) if n == sum( int(d) ** power for d in str( n ) ) )

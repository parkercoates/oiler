#! /usr/bin/python

from math import sqrt, ceil

def sumOfDivisors( n ) :
	root = int( ceil( sqrt( n ) ) )
	total = 1
	for i in xrange( 2, root ) :
		if n % i == 0 :
			total += i + n // i
	if n != 1 and n == root * root:
		total += root
	return total


def isSumOfTwoAbundants( n ) :
	return any( (n-a in abundants) for a in abundants )

abundants = set()
total = 0

for n in xrange( 1, 28124 ) :
	if sumOfDivisors( n ) > n :
		abundants.add( n )
	if not isSumOfTwoAbundants( n ) :
		total += n
		
print total

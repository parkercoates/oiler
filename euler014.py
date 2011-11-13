#! /usr/bin/python

storedLengths = { 1: 1 }

def chainLength( n ) :
	if n not in storedLengths :
		storedLengths[n] = 1 + chainLength( n/2 if n%2==0 else 3*n+1 )
	return storedLengths[n]

maximum = longestStart = 0
for i in xrange( 1, 1000001 ) :
	if chainLength( i ) > maximum :
		maximum = chainLength( i )
		longestStart = i
		
print "Result:", longestStart, "->", maximum, "steps"
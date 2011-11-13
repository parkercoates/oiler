#! /usr/bin/python

def factorial( n ) :
	if n == 1:
		return 1
	else :
		return n * factorial( n - 1 )

print "\nResult:", sum( [ int(i) for i in list( str( factorial(100) ) ) ] )





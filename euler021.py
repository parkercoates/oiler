#! /usr/bin/python

from math import sqrt

dValues = { 1:0 }

def d( n ) :
	if n not in dValues :
		dValues[n] = 1
		root = int(sqrt(n))
		for i in xrange( 2, root ) :
			if n % i == 0 :
				dValues[n] += i + n // i
		if sqrt(n) == root :
			dValues[n] += root
	return dValues[n]

def isAmicable( n ) :
	return d(n) != n and d(d(n)) == n

print "\nResult:", sum( n for n in xrange( 2, 10000 ) if isAmicable( n ) )
#! /usr/bin/python
# -*- coding: utf-8 -*-

#import psyco
#psyco.full()

from math import log

class PrimeFinder( object ) :
	'''A class for testing primeness'''
	def __init__( self, initialSize = 1024 ) :
		self.sieve = [ False, False, True, True ]
		self._expandSieve( initialSize )

	def isPrime( self, n ) :
		if n >= len( self.sieve ) :
			self._expandSieve( n )
		return self.sieve[ n ]

	def primeRange( self, low, high ) :
		if high >= len( self.sieve ) :
			self._expandSieve( n )
		return [ i for i in xrange( low, high ) if self.sieve[i] ]

	def _expandSieve( self, n ) :
		print "=== Expanding Sieve ==="
		oldSize = len( self.sieve )
		if n >= oldSize :
			newSize = int( 2 ** ( int( log( n, 2 ) ) + 1 ) )
			self.sieve += [ False, True ] * ( ( newSize - oldSize ) / 2 )
			for i in xrange( 2, newSize / 2 ):
				if self.sieve[i] :
					for j in xrange( i * ( ( oldSize // i + 1 ) if i < oldSize else 2 ), newSize, i ) :
						self.sieve[j] = False


pf = PrimeFinder(10000000)


n = 1
sideLength = 2
totalCorners = 1
primeCorners = 0

while True :
	for i in xrange(4) :
		n += sideLength
		if pf.isPrime( n ) :
			primeCorners += 1
			print "*", n,
		else :
			print n,

	totalCorners += 4
	ratio = float( primeCorners ) / totalCorners
	print "\nRatio:", primeCorners, "/", totalCorners, "=", ratio
	if ratio < 0.10 :
		break
	sideLength += 2

print "Side Length:", sideLength + 1


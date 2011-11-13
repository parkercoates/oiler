#! /usr/bin/python

def circularCandidates() :
	'''Generates all candiates for circular primeness'''

	def incrementDigit( n ) :
		'''Increments an individual digit of a candidate.
		Returns the digit's new value and whether the next digit should also be incremented'''
		if n == 1 :
			return 3, False
		elif n == 3 :
			return 7, False
		elif n == 7 :
			return 9, False
		elif n == 9 :
			return 1, True
		else :
			return 1, False

	for p in [ 2, 3, 5, 7 ] :
		yield p

	c = [ 0, 0, 0, 0, 1, 1 ]
	n = 11
	while n < 999999 :
		yield n
		
		carryOn = True
		i = -1
		while carryOn and i >= -len(c) :
			c[i], carryOn = incrementDigit( c[i] )
			i -= 1

		n = 0
		for i in c :
			n = n * 10 + i


def rotations( n ) :
	'''Generates all rotations of digits in n'''
	yield n
	string = str( n )
	for i in xrange( len( string ) - 1 ) :
		string = string[1:] + string[0]
		yield int( string )


class PrimeFinder( object ) :
	'''A class for testing primeness'''
	def __init__( self ) :
		self.primes = set()
	def isPrime( self, n ) :
		if n in self.primes :
			return True
		elif n > 1 and not any( n % i == 0 for i in xrange( 2, int( n ** 0.5 ) + 1 ) ) :
			self.primes.add( n )
			return True
		else :
			return False


circularPrimes = set()
pf = PrimeFinder()

for i in circularCandidates() :
	if all( pf.isPrime( n ) for n in rotations( i ) ) :
		circularPrimes.add( i )

print len( circularPrimes )
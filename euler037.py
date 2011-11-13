#! /usr/bin/python

class PrimeFinder( object ) :
	'''A class for testing primeness'''
	def __init__( self ) :
		self.primes = set()
		self.notPrimes = set( [ 1 ] )
	def isPrime( self, n ) :
		if n in self.primes :
			return True
		elif n in self.notPrimes :
			return False
		else :
			if all( n % i for i in xrange( 2, int( n ** 0.5 ) + 1 ) ) :
				self.primes.add( n )
				return True
			else :
				self.notPrimes.add( n )
				return False


def truncatableCandidates() :
	'''Generates all candiates for dual truncatable primeness'''
	def incrementHighestDigit( n ) :
		if n == 2 :   return 3, False
		elif n == 3 : return 5, False
		elif n == 5 : return 7, False
		elif n == 7 : return 1, True
		else :        return 3, False
	def incrementDigit( n ) :
		if n == 1 :   return 3, False
		elif n == 3 : return 7, False
		elif n == 7 : return 9, False
		else :        return 1, True
	def incrementLowestDigit( n ) :
		if n == 3 :   return 7, False
		elif n == 7 : return 3, True
		else :        return 3, False

	c = [ 2, 3 ]
	while True :
		n = 0
		for i in c :
			n = n * 10 + i
		yield n

		i = len( c ) - 1
		c[i], carryOn = incrementLowestDigit( c[i] )
		while carryOn and i > 1:
			i -= 1
			c[i], carryOn = incrementDigit( c[i] )
		if carryOn :
			c[0], carryOn = incrementHighestDigit( c[0] )
		if carryOn :
			c = [ 2 ] + c


def truncations( n ) :
	'''Generates all two or more digit truncations of n'''
	string = str( n )
	for i in xrange( 2, len( string ) ) :
		yield int( string[:i] )
		yield int( string[-i:] )
	yield n


pf = PrimeFinder()
truncatablePrimes = set()
for i in truncatableCandidates() :
	if all( pf.isPrime( n ) for n in truncations( i ) ) :
		truncatablePrimes.add( i )
		if len( truncatablePrimes ) == 11 :
			break
print sum( truncatablePrimes )

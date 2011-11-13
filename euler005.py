#! /usr/bin/python

from operator import mul

def primeFactors( n ) :
	factors = []
	f = 2
	while n > 1 :
		if n % f == 0 :
			n /= f
			factors.append( f )
		else :
			f += 1
	return factors


def lowestCommonDenominator( lst ) :
	factorDict = {}
	for n in lst :
		primes = primeFactors( n )
		for p in primes :
			factorDict[p] = max( factorDict.get( p, 0 ), primes.count( p ) )

	return reduce( mul, ( p**factorDict[p] for p in factorDict.keys() ) )


print lowestCommonDenominator( range( 1, 21 ) )
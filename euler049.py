#! /usr/bin/python

def primeSet( low, high ) :
	'''Returns the set of primes between low and high.'''
	primes = [ False, False ] + [ True ] * ( high - 2 )
	for i in xrange( 2, high ):
		if primes[i] :
			multiple = i + i
			while multiple < high:
				primes[multiple] = False
				multiple += i
	return set( i for i in xrange( low, high ) if primes[i] )


def permutations( lst ) :
	'''Generates sequential permutations of lst.'''
	if len( lst ) > 1 :
		for i in xrange( len( lst ) ) :
			for rest in permutations( lst[:i] + lst[i+1:] ) :
				yield lst[i:i+1] + rest
	else:
		yield lst


def digitPermutations( n ) :
	'''Returns set of digit permutations of n.'''
	result = set()
	for s in permutations( str( n ) ) :
		result.add( int( s ) )
	return result


def peek( s ) :
	'''Returns the item at the "top" of s without removing it.'''
	return iter( s ).next()


primes = primeSet( 1000, 10000 )

while len( primes ) :
	# Get a random number from primes and produce a sorted list of all the prime permutations of its digits
	primePerms = sorted( n for n in digitPermutations( peek( primes ) ) if n in primes )
	length = len( primePerms )

	# Try all possible increment steps
	for i in xrange( 0, length - 2 ) :
		for j in xrange( i + 1, length - 1 ) :
			step = primePerms[j] - primePerms[i]

			# Check for second occurance of increment
			for k in xrange( j + 1, length ) :
				if primePerms[k] - primePerms[j] == step :
					print primePerms[i], primePerms[j], primePerms[k]

	# Remove numbers used from primes
	primes = primes.difference( set( primePerms ) )

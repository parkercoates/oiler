#! /usr/bin/python

n = 1
primes = set()

while True :
	n += 2
	if all( n % p for p in primes ) :
		primes.add( n )
	else :
		if not any( (n-2*i*i) in primes for i in xrange( 1, n ) ) :
			break

print n
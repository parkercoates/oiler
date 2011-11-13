#! /usr/bin/python

import psyco
psyco.full()

def primes( low, high ) :
	'''Returns a list of primes between low and high and a prime lookup list up to high.'''
	primes = [ False, False ] + [ True ] * ( high - 2 )
	for i in xrange( 2, high ):
		if primes[i] :
			for j in xrange( i+i, high, i ) :
				primes[j] = False
	return [ i for i in xrange( low, high ) if primes[i] ], primes


primeList, primeLookup = primes( 0, 1000000 )
prime = longest = 0

for i in xrange( 0, len( primeList ) - 2 ) :
	if i == 0 :
		total = 5
		j = 2
	else :
		total = primeList[i]
		j = i + 1
		
	while total < 1000000 :
		if primeLookup[total] :
			length = j - i + 2
			if length > longest :
				prime, longest = total, length
				
		total += primeList[j] + primeList[j+1]
		j += 2

print prime
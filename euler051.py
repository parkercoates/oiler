#! /usr/bin/python

import psyco
psyco.full()


def primes( low, high ) :
	'''Returns a list of primes between low and high and a prime lookup list from zero to high.'''
	primes = [ False, False ] + [ True ] * ( high - 2 )
	for i in xrange( 2, high ):
		if primes[i] :
			for j in xrange( i+i, high, i ) :
				primes[j] = False
	return [ i for i in xrange( low, high ) if primes[i] ], primes


def templates( n ) :
	'''Generates all possible prime digit replacement templates of number n.'''
	
	def subtemplates( s, digit ) :
		'''Recursively generates subtemplates.'''
		yield s
		for j in xrange( 0, len( s ) - 1 ) :
			if s[j] == digit :
				for st in subtemplates( s[j+1:], digit ) :
					yield s[:j] + '*' + st

	s = str( n )
	for i in xrange( 0, len( s ) - 1 ) :
		for st in subtemplates( s[i+1:], s[i] ) :
			yield s[:i] + '*' + st


primeList, primeLookup = primes( 56003, 1000000 )

for n in primeList :
	for t in templates( n ) :
		digits = ( '123456789' if t[0] == '*' else '0123456789' )
		family = sorted( f for f in ( int(t.replace('*',c)) for c in digits ) if primeLookup[f] )
		if len( family ) >= 8 :
			print t, family
			exit()



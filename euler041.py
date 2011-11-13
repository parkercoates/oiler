#! /usr/bin/python

def permutations( lst ) :
	'''Returns sequential permutations of a list'''
	if len( lst ) > 1 :
		for i in xrange( len( lst ) ) :
			for rest in permutations( lst[:i] + lst[i+1:] ) :
				yield lst[i:i+1] + rest
	else:
		yield lst


for digits in [ "7654321", "4321" ] :
	for s in permutations( digits ) :
		n = int( s )
		if all( n % i != 0 for i in xrange( 2, int( n ** 0.5 ) + 1 ) ) :
			print n
			exit()

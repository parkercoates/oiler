#! /usr/bin/python

def permutations( lst ) :
	'''Returns sequential permutations of a list'''
	if len( lst ) > 1 :
		for i in xrange( len( lst ) ) :
			for rest in permutations( lst[:i] + lst[i+1:] ) :
				yield lst[i:i+1] + rest
	else:
		yield lst

def hasProperty( s ) :
	return int( s[1:4] ) % 2 == 0 \
	and int( s[2:5] ) % 3 == 0 \
	and int( s[3:6] ) % 5 == 0 \
	and int( s[4:7] ) % 7 == 0 \
	and int( s[5:8] ) % 11 == 0 \
	and int( s[6:9] ) % 13 == 0 \
	and int( s[7:10] ) % 17 == 0

print sum( int( s ) for s in permutations( '0123456789' ) if hasProperty( s ) )

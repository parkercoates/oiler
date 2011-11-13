#! /usr/bin/python

def permutations( lst ) :
	'''Returns sequential permutations of a list'''
	if len( lst ) > 1 :
		for i in xrange( len( lst ) ) :
			for rest in permutations( lst[:i] + lst[i+1:] ) :
				yield lst[i:i+1] + rest
	else:
		yield lst

solutions = set()

#for p in permutations( range( 1, 10 ) ) :
	#product = p[5] * 1000 + p[6] * 100 + p[7] * 10 + p[8]
	#if (p[0] * 10 + p[1]) * (p[2] * 100 + p[3] * 10 + p[4]) == product \
	#or p[0] * ( p[1] * 1000 + p[2] * 100 + p[3] * 10 + p[4] ) == product :
		#solutions.add( product )

for p in permutations( '123456789' ) :
	product = int( p[5:] )
	if int(p[0]) * int(p[1:5]) == product or int(p[0:2]) * int(p[2:5]) == product :
		solutions.add( product )

print sum( solutions )

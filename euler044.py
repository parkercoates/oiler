#! /usr/bin/python


#pentagonals = [ n*(3*n-1)/2 for n in xrange( 1, 1000000 ) ]
#pentSet = set( pentagonals )

#for i in xrange( len( pentagonals ) ) :
	#for j in xrange( i ) :
		#if ( pentagonals[i] + pentagonals[j] ) in pentSet and ( pentagonals[i] - pentagonals[j] ) in pentSet :
			#print pentagonals[i] - pentagonals[j]
			#exit()

def pentagonals() :
	i = 1
	while True :
		yield i*(3*i-1)/2
		i += 1

pentSet = set()
for i in pentagonals() :
	for j in pentSet :
		if i - j in pentSet and abs( i - j - j ) in pentSet :
			print abs( i - j - j )
			exit()
	pentSet.add( i )

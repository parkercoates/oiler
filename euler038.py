#! /usr/bin/python

biggest = 0
for i in xrange( 1, 9876 ) :
	string = ''
	for n in xrange( 1, 10 ) :
		string += str( n * i )
		if len( string ) >= 9 :
			break
	if len( string ) == 9 and all( c in string for c in '123456789' ) :
		biggest = max( biggest, int( string ) )
print biggest

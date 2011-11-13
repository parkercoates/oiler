#! /bin/python

def nDigitSequenceGen( digits, function ) :
  n = 1
  result = []
  while True :
    m = function( n )
    if m >= 10 ** digits :
      return result
    elif m >= 10 ** ( digits - 1 ) :
      result.append( m )
    n += 1

polygonals = {}
polygonals[ 3 ] = nDigitSequenceGen( 4, lambda n : n * (     n + 1 ) / 2 )
polygonals[ 4 ] = nDigitSequenceGen( 4, lambda n : n * (     n     )     )
polygonals[ 5 ] = nDigitSequenceGen( 4, lambda n : n * ( 3 * n - 1 ) / 2 )
polygonals[ 6 ] = nDigitSequenceGen( 4, lambda n : n * ( 2 * n - 1 )     )
polygonals[ 7 ] = nDigitSequenceGen( 4, lambda n : n * ( 5 * n - 3 ) / 2 )
polygonals[ 8 ] = nDigitSequenceGen( 4, lambda n : n * ( 3 * n - 2 )     )

def findCycle( sequence, unusedPolygonalTypes ) :
  #print sequence
  for p in unusedPolygonalTypes :
    for i in polygonals[ p ] :
      if i // 100 == sequence[-1] % 100 :
	if len( unusedPolygonalTypes ) == 1 and i % 100 == sequence[0] // 100 :
	  sequence.append( i )
	  print sequence
	  print "Sum:", sum( sequence )
	  exit()
	else :
	  unused = unusedPolygonalTypes.copy()
	  unused.remove( p )
	  findCycle( sequence + [ i ], unused )


for i in polygonals[ 3 ] :
  findCycle( [ i ], set( xrange( 4, 9 ) ) )





#! /usr/bin/python

add = lambda x,y:x+y
sumOfSquares = reduce( add, [i*i for i in xrange(1,101) ] )
squareOfSums = pow( reduce( add, xrange(1,101) ), 2 )

print squareOfSums - sumOfSquares

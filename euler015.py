#! /usr/bin/python

size = 21
sizeMinus1 = size - 1

grid = [ [1] * size ] + [ ( [1] + [0] * sizeMinus1 ) for i in range( sizeMinus1 ) ]

for i in range( 1, size ) :
	for j in range( 1, size ) :
		grid[i][j] = grid[i-1][j] + grid[i][j-1]

print grid[sizeMinus1][sizeMinus1]
#! /usr/bin/python

def isTriangular( n ) :
	return ( ( 1 + 8 * n ) ** 0.5 - 1 ) / 2 % 1 == 0

def isPentagonal( n ) :
	return ( 1 + ( 1 + 24 * n ) ** 0.5 ) / 6 % 1 == 0

i = 143
while True :
	i += 1
	hexagonal = i * ( 2 * i - 1 )
	if isTriangular( hexagonal ) and isPentagonal( hexagonal ) :
		print hexagonal
		break

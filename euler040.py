#! /usr/bin/python

from math import log

#def digits() :
	#n = 1
	#while True:
		#for c in str( n ) :
			#yield int( c )
		#n += 1

#d = i = r = 1
#for n in digits() :
	#if i == d :
		#r *= n
		#if d == 1000000 :
			#break
		#else :
			#d *= 10
	#i += 1
#print r

l = 0
n = d = product = 1
while l < 1000000:
	l += len( str( n ) )
	if l >= d:
		product *= int( str( n )[ d - l - 1 ])
		d *= 10
	n += 1
print product

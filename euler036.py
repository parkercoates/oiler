#! /usr/bin/python

def isPalindromic( s ) :
	return s == s[::-1]

def binaryStr( n ) :
	s = ''
	while n > 0 :
		n, r = divmod( n, 2 )
		s = ('1' if r else '0') + s
		#s = str( n & 1 ) + s
		#n = n >> 1
	return s

print sum( n for n in xrange( 1, 1000000, 2 ) if isPalindromic( str(n) ) and isPalindromic( binaryStr(n) ) )
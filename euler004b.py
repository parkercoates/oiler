#! /usr/bin/python

from math import sqrt

def isPalindromic( x ):
	string = str( x )
	for i in range( 0, len(string)//2 ) :
		if string[i] != string[-1-i] :
			return False;
	return True

biggestPalindrome = 1

i = 999
while i > sqrt( biggestPalindrome ):
	j = 999
	while j > biggestPalindrome / i :
		if isPalindromic( i * j ) :
			biggestPalindrome = max( i * j, biggestPalindrome )
			break;
		j -= 1
	i -= 1

print biggestPalindrome
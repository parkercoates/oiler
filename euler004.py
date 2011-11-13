#! /usr/bin/python

from math import sqrt

def isPalindromic( x ):
	string = str( x )
	result = True
	while len( string ) > 1 :
		if string[0] != string[-1] :
			result = False;
			break;
		else :
			string = string[1:-1]
	return result

biggestPalindrome = 1

i = 999
while i > sqrt( biggestPalindrome ):
	j = 999
	while j > biggestPalindrome / i :
		product = i * j

		if isPalindromic( product ) :
			if product > biggestPalindrome :
				biggestPalindrome = product
			print i, "*", j, "=", product, "   --   ", biggestPalindrome
			break;
			
		j -= 1
	i -= 1



print biggestPalindrome
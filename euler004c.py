#! /usr/bin/python

from math import sqrt

biggestPalindrome = 1
i = 999
while i > sqrt( biggestPalindrome ):
	j = 999
	while j > biggestPalindrome / i :
		string = str( i * j )
		if string == string[::-1] :
			biggestPalindrome = max( i * j, biggestPalindrome )
			break;
		j -= 1
	i -= 1

print biggestPalindrome

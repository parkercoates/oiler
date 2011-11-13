#! /usr/bin/python
# -*- coding: utf-8 -*-

from math import sqrt

primeNumbers = [2]
j = 3
while j < 2000000 :
	prime = True;
	for k in primeNumbers :
		if j % k == 0 :
			prime = False;
			break
		if k > sqrt(j) :
			break
		
	if prime :
		primeNumbers.append(j)

	j += 2

print sum(primeNumbers)


## Sieve implementation. Not mine, but very nice.
#marked = [0] * 1000000
#value = 3
#s = 2
#while value < 1000000:
    #if marked[value] == 0:
        #s += value
        #i = value
        #while i < 1000000:
            #marked[i] = 1
            #i += value
    #value += 2
#print s

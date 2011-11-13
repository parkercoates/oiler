#! /usr/bin/python

from math import sqrt

primeNumbers = [2]
j = 3
while len(primeNumbers) < 10001 :
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


print primeNumbers[-1]
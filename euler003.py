#! /usr/bin/python

number = 317584931803
remainder = number
primeNumbers = []
primeFactors = []

i = 2
while remainder > 1 :

	prime = True;
	for j in primeNumbers :
		if i % j == 0 :
			prime = False;
			break

	if prime :
		primeNumbers.append(i)

		while remainder % i == 0 :
			primeFactors.append(i)
			remainder /= i

	i += 2 if i != 2 else 1

print primeFactors

#! /usr/bin/python

number = 317584931803
remainder = number

i = 2
while remainder > 1 :
	if remainder % i == 0 :
		remainder /= i
	else :
		i+=1

print i
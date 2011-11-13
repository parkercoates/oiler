#! /usr/bin/python

i, j = 0, 1

sum = 0

while j < 1000000 :
	i, j = j, i+j
	if j%2==0 :
		sum += j
	
print sum
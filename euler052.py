#! /usr/bin/python

n = 0
while True :
	n += 1
	if set(str( n )) == set(str(n*2)) == set(str(n*3)) == set(str(n*4)) == set(str(n*5)) == set(str(n*6)) :
		break
print n


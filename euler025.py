#! /usr/bin/python

bigNum = long( '1' + '0'*999 )

x,y = 1,1
i = 2

while y < bigNum :
	x,y = y,x+y
	i += 1
	
print i


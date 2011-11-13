#! /usr/bin/python

sum = 1000
a = b = 1
result = False
while a < sum / 3 and not result :
	while b < ( sum - a ) :
		c = sum - a - b
		if c*c == a*a + b*b :
			result = (a,b,c)
			break
		b += 1
	b = 1
	a += 1

print result[0], "^2 +", result[1], "^2 =", result[2], "^2"
print result[0], "*",result[1],"*",result[2],"=",result[0]*result[1]*result[2]
#! /usr/bin/python

import decimal

prec = 3000

decimal.getcontext().prec = prec
decimal.getcontext().rounding = decimal.ROUND_DOWN

maxLength = 0
denominator = 1

for i in xrange( 2, 1000 ) :
	s = list( str( 1 / decimal.Decimal(i) ) )

	if len(s) < prec :
		continue
	
	s.reverse()

	for l in xrange( 1, prec / 3 ) :
		if s[0:l] == s[l:2*l] == s[2*l:3*l] :
			break
	else :
		l = 0
		print i, "needs more precision!"

	if l > maxLength :
		maxLength = l
		denominator = i

print denominator, ":", maxLength


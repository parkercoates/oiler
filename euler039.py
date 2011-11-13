#! /usr/bin/python

triDict = {}
for a in xrange( 1, 500 ) :
	for b in xrange( 1, a + 1 ) :
		c = ( a * a + b * b ) ** 0.5
		if c % 1 == 0 :
			p = a + b + int( c )
			if p < 1000 :
				triDict[p] = triDict.get( p, 0 ) + 1

maxPerimeter = 0
maxCount = 0
for perimeter, count in triDict.items() :
	if count > maxCount :
		maxPerimeter = perimeter
		maxCount = count
print maxPerimeter

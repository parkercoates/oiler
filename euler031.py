#! /usr/bin/python

total = 200
solutions = 0

for a in xrange( total // 200 + 1 ) :
	for b in xrange( total // 100 + 1 ) :
		if 200*a + 100*b > total :
			break
		for c in xrange( total // 50 + 1 ) :
			if 200*a + 100*b + 50*c > total :
				break
			for d in xrange( total // 20 + 1 ) :
				if 200*a + 100*b + 50*c + 20*d  > total :
					break
				for e in xrange( total // 10 + 1 ) :
					if 200*a + 100*b + 50*c + 20*d + 10*e > total :
						break
					for f in xrange( total // 5 + 1 ) :
						if 200*a + 100*b + 50*c + 20*d + 10*e + 5*f > total :
							break
						for g in xrange( total // 2 + 1 ) :
							if 200*a + 100*b + 50*c + 20*d + 10*e + 5*f + 2*g <= total :
								solutions += 1
								break

print solutions

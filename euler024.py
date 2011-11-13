#! /usr/bin/python

from sys import exit

def removed( s, i ) :
	remainder = s.copy()
	remainder.remove( i )
	return remainder

counter = 0
digitsA = set(xrange(10))
for a in digitsA :
	digitsB = removed( digitsA, a )
	for b in digitsB :
		digitsC = removed( digitsB, b )
		for c in digitsC :
			digitsD = removed( digitsC, c )
			for d in digitsD :
				digitsE = removed( digitsD, d )
				for e in digitsE :
					digitsF = removed( digitsE, e )
					for f in digitsF :
						digitsG = removed( digitsF, f )
						for g in digitsG :
							digitsH = removed( digitsG, g )
							for h in digitsH :
								digitsI = removed( digitsH, h )
								for i in digitsI :
									digitsJ = removed( digitsI, i )
									for j in digitsJ :
										counter += 1
										if counter == 1000000 :
											print "%s%s%s%s%s%s%s%s%s%s" % (a,b,c,d,e,f,g,h,i,j)
											exit()

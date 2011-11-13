#! /usr/bin/python

#import psyco
#psyco.full()

#def distinctPrimeFactors( n, n2 ) :
	#last = 0
	#count = 0
	#d = 2
	#while n > 1 :
		#if n % d == 0 :
			#n /= d
			#if d != last :
				#count += 1
				#if count > n2 :
					#return False
				#last = d
		#else :
			#d += 1
	#return count == n2

#target = 4
#n = 1
#consecutive = 0
#while True :
	#n += 1
	#if distinctPrimeFactors( n, target ) :
		#consecutive += 1
		#if consecutive == target :
			#break
	#else :
		#consecutive = 0

#for i in xrange( 1 - target, 1 ) :
	#print n + i

target = 4
limit = 1000000     # Search under 1 million for now
factors = [0] * limit
count = 0
for i in xrange( 2, limit ):
	if factors[i] == target:
		count += 1
		if count == target:
			print i - target + 1
			break
	else:
		if factors[i] == 0:
			val = i
			while val < limit:
				factors[val] += 1
				val += i
		count = 0
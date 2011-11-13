#! /usr/bin/python

class PrimeFinder( object ) :
	def __init__( self ) :
		self.primes = set()
	def isPrime( self, n ) :
		if n in self.primes :
			return True
		elif n > 1 and not any( n % i == 0 for i in self.primes ) :
			self.primes.add( n )
			return True
		else :
			return False


#class PrimeFinder2( object ) :
	#def __init__( self, sieveMax = 0 ) :
		#self.primes = set()
		#self.sieveMax = sieveMax
		
		#if sieveMax > 0 :
			#sieve = set( xrange( 2, sieveMax ) )
			#for n in sieve :
				#if any( n % p == 0 for p in self.primes ) :
					#for i in xrange( 1, sieveMax // n, 2 ) :
						#sieve.remove( n * i )
				#else :
					#self.primes.add( n )

	#def isPrime( self, n ) :
		#if n in self.primes :
			#return True
		#elif n > self.sieveMax and not any( n % i == 0 for i in self.primes ) :
			#self.primes.add( n )
			#return True
		#else :
			#return False

pf = PrimeFinder()

maximum = ( 0, 0, 0 )

for i in xrange( -999, 1000 ) :
	for j in xrange( 2, 1000 ) :
		k = 0
		while pf.isPrime( k*k + i*k + j ) :
			k += 1
		if k > maximum[0] :
			maximum = ( k, i, j )

print maximum[1] * maximum[2]
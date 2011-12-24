#! /usr/bin/python

class Card( object ) :
	def __init__( self, s ) :
		if s[0] == 'A' :
			self.r = 14
		elif s[0] == 'K' :
			self.r = 13
		elif s[0] == 'Q' :
			self.r = 12
		elif s[0] == 'J' :
			self.r = 11
		elif s[0] == 'T' :
			self.r = 10
		else :
			self.r = int( s[0] )

		if s[1] == 'S' :
			self.s = 0
		elif s[1] == 'H' :
			self.s = 1
		elif s[1] == 'D' :
			self.s = 2
		else :
			self.s = 3

	def __cmp__( self, other ) :
		if self.r == other.r :
			return 0
		elif self.r > other.r :
			return 1
		else :
			return -1


class Hand( object ) :
	def __init__( self, s ) :
		self.cards = tuple( sorted( Card( c ) for c in s.split(' ') ) )
		self.rank == self.rank()

	def __cmp__( self, other ) :
		if self.rank > other.rank :
			return 1
		elif self.rank == other.rank :
			return 0
		else :
			return -1

	def rank( self ) :
		c = list( self.cards )

		def assembleRank( r, c1, c2, c3, c4, c5 ) :
			return r * 10000000000 + c1 * 100000000 + c2 * 1000000 + c3 * 10000 + c4 * 100 + c5
		
		isFlush = ( c[0].s == c[1].s == c[2].s == c[3].s == c[4].s )
		isStraight = ( c[0].r+4 == c[1].r+3 == c[2].r+2 == c[3].r+1 == c[4].r )

		# Straight flush
		if isFlush and isStraight :
			self.rank = assembleRank( 9, c[4].r, c[3].r, c[2].r, c[1].r, c[0].r )

		# Four of a Kind
		elif c[0].r == c[3].r :
			self.rank = assembleRank( 8, c[0].r, c[1].r, c[2].r, c[3].r, c[4].r )
		elif c[1].r == c[4].r :
			self.rank = assembleRank( 8, c[1].r, c[2].r, c[3].r, c[4].r, c[0].r )

		# Full House
		elif c[0].r == c[1].r and c[2].r == c[4].r :
			self.rank = assembleRank( 7, c[2].r, c[3].r, c[4].r, c[0].r, c[1].r )
		elif c[0].r == c[2].r and c[3].r == c[4].r :
			self.rank = assembleRank( 7, c[0].r, c[1].r, c[2].r, c[3].r, c[4].r )

		# Flush
		elif isFlush :
			self.rank = assembleRank( 6, c[4].r, c[3].r, c[2].r, c[1].r, c[0].r )

		# Straight
		elif isStraight :
			self.rank = assembleRank( 5, c[4].r, c[3].r, c[2].r, c[1].r, c[0].r )

		# Three of a Kind
		elif c[0].r == c[2].r :
			self.rank = assembleRank( 4, c[0].r, c[1].r, c[2].r, c[4].r, c[3].r )
		elif c[1].r == c[3].r :
			self.rank = assembleRank( 4, c[1].r, c[2].r, c[3].r, c[4].r, c[0].r )
		elif c[2].r == c[4].r :
			self.rank = assembleRank( 4, c[2].r, c[3].r, c[4].r, c[1].r, c[0].r )

		# Two Pair
		elif c[0].r == c[1].r and c[2].r == c[3].r :
			self.rank = assembleRank( 3, c[2].r, c[3].r, c[0].r, c[1].r, c[4].r )
		elif c[0].r == c[1].r and c[3].r == c[4].r :
			self.rank = assembleRank( 3, c[3].r, c[4].r, c[0].r, c[1].r, c[2].r )
		elif c[1].r == c[2].r and c[3].r == c[4].r :
			self.rank = assembleRank( 3, c[3].r, c[4].r, c[1].r, c[2].r, c[0].r )

		# One Pair
		elif c[0].r == c[1].r :
			self.rank = assembleRank( 2, c[0].r, c[1].r, c[4].r, c[3].r, c[2].r )
		elif c[1].r == c[2].r :
			self.rank = assembleRank( 2, c[1].r, c[2].r, c[4].r, c[3].r, c[0].r )
		elif c[2].r == c[3].r :
			self.rank = assembleRank( 2, c[2].r, c[3].r, c[4].r, c[1].r, c[0].r )
		elif c[3].r == c[4].r :
			self.rank = assembleRank( 2, c[3].r, c[4].r, c[2].r, c[1].r, c[0].r )

		# High Card
		else :
			self.rank = assembleRank( 1, c[4].r, c[3].r, c[2].r, c[1].r, c[0].r )

wins = 0
for h in open("euler054.data") :
#	print h[:14], '  vs  ', h[15:]
	p1 = Hand( h[:14] )
	p2 = Hand( h[15:] )
#	print str( p1.rank ).center( 14 ),
	if p1 > p2 :
		wins += 1
#		print 'beats ',
#	else :
#		print 'loses ',
#	print str( p2.rank ).center( 14 )
#	print
print wins

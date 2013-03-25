#! /bin/python

def keyGen() :
  for a in xrange( ord('a'), ord('z')+1 ) :
    for b in xrange( ord('a'), ord('z')+1 ) :
      for c in xrange( ord('a'), ord('z')+1 ) :
        yield (a, b, c)

with open( "euler059.data" ) as f:
  message = [ int(word) for word in f.read().split(',') ]
  for key in keyGen() :
    snippet = ''
    for i in xrange( 100, 200 ) :
      snippet += chr( message[i] ^ key[ i % 3 ] )
      if snippet[-5:] == " the " :
        decodedAscii = [ message[i] ^ key[ i % 3 ] for i in xrange( 0, len( message ) ) ]
        #print ''.join( chr( a ) for a in decodedAscii )
        #print "Key = " + chr(key[0]) + chr(key[1]) + chr(key[2])
        print sum( decodedAscii )
        exit()




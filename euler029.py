#! /usr/bin/python

print len( set( i**j for i in xrange( 2, 101 ) for j in xrange( 2, 101 ) ) )
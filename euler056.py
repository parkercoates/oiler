#! /usr/bin/python

print max( sum(int(d) for d in str(x**y)) for y in xrange(1,100) for x in xrange(1,100) )
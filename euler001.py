#! /usr/bin/python
 
print reduce( ( lambda x,y: x+y ), [ i for i in xrange(1,1000) if ( i%3==0 or i%5==0 ) ] )
	

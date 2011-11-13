#! /usr/bin/python

onesText = { 1: "one",
             2: "two",
             3: "three",
             4: "four",
             5: "five",
             6: "six",
             7: "seven",
             8: "eight",
             9: "nine",
             10: "ten",
             11: "eleven",
             12: "twelve",
             13: "thirteen",
             14: "fourteen",
             15: "fifteen",
             16: "sixteen",
             17: "seventeen",
             18: "eighteen",
             19: "nineteen" }

tensText = { 2: "twenty",
             3: "thirty",
             4: "forty",
             5: "fifty",
             6: "sixty",
             7: "seventy",
             8: "eighty",
             9: "ninety"  }


def numberToText( n ) :
	text = ''
	if n == 1000 :
		text = "one thousand"
	else :
		hundreds = n // 100
		n %= 100	
		if hundreds :
			text += onesText[hundreds] + " hundred"
			if n :
				text += " and "
		tens = n // 10
		if tens >= 2 :
			n %= 10
			text += tensText[tens]
			if n :
				text += '-'
		if n :
			text += onesText[n]
	return text


total = 0
for i in xrange( 1, 1001 ) :
	result = numberToText( i )
	length = len( result.replace(' ','').replace('-','') )
	total = total + length

	print "%-35s : %5d" % (result, length)

print "-" * 45
print "%43d" % total

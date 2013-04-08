#! /usr/bin/env python

import sys

cubeCounts = {}
i = 1
while True:
    cube =  i * i * i
    key = int(''.join(reversed(sorted(str(cube)))))
    oldValue = cubeCounts.get(key, (cube, 0))
    count = oldValue[1] + 1
    if count == 5:
        print cubeCounts[key][0]
        sys,exit()

    cubeCounts[key] = oldValue[0], count
    i += 1

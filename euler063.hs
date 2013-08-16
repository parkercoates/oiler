powerEqualsLengthCount n = length . takeWhile powerEqualsLength $ [1..]
   where powerEqualsLength m = digitLengthIsEqual (n^m) m
         digitLengthIsEqual x d = 10^(d-1) <= x && x < 10^d

main = print . sum . map powerEqualsLengthCount $ [1..9]

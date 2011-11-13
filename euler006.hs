
sumOfSquares = sum . map (^2)
squareOfSum = (^2) . sum
squareSumDifference xs = squareOfSum xs - sumOfSquares xs

main = print $ squareSumDifference [1..100]


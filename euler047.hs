import EulerUtils (primeFactors)

removeRepeats (x:(yys@(y:ys))) | x == y    = removeRepeats yys
                               | otherwise = x : removeRepeats yys
removeRepeats xs = xs

numPrimeFactors = length . removeRepeats . primeFactors

main = print . head . filter test $ [2..]
   where test n = all ((4==) . numPrimeFactors) [n..n+3]

main' = print $ f 2 0
   where f n 4 = n - 4
         f n c | numPrimeFactors n == 4 = f (n+1) (c+1)
               | otherwise              = f (n+1) 0


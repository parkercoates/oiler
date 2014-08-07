import EulerUtils (primes)

main = let limit = 1000000
           lastBelowLimit = last . takeWhile (<= limit)
           primeProduct = lastBelowLimit . scanl1 (*) $ primes
       in  print . lastBelowLimit . map (*primeProduct) $ [1..]

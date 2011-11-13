import EulerUtils (primes)

main = print s
   where s = sum . map fromIntegral . takeWhile (< 2000000) $ primes :: Integer


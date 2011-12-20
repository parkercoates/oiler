import Data.List (tails)
import EulerUtils (isPrime, primes)

search ps = s ps 0 0 0 0
   where s []     bl bt _  _  = (bl, bt)
         s (p:ps) bl bt cl ct | ct + p >= 1000000 = (bl, bt)
                              | otherwise         = let ct' = ct + p
                                                        cl' = cl + 1
                                                        (bl', bt') = if isPrime ct' then (cl', ct') else (bl, bt)
                                                    in s ps bl' bt' cl' ct'

main = print . snd . maximum . map search . tails . takeWhile (<50000) $ primes

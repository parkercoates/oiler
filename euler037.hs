import Data.List (inits, tails)
import EulerUtils (isPrime, primes, digits, fromDigits)

digitTruncations = map fromDigits . truncs . digits
   where leftTruncs = init . tails . tail
         rightTruncs = tail . inits . init
         truncs xs = leftTruncs xs ++ rightTruncs xs

isTruncatablePrime = all isPrime . digitTruncations

main = print . sum . take 11 . filter isTruncatablePrime . dropWhile (<10) $ primes


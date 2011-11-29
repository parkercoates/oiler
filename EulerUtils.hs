module EulerUtils
(
    divides
,   maybeSqrt

,   genericPrimeFactors
,   genericIsPrime
,   genericPrimes
,   primeFactors
,   isPrime
,   primes

,   revDigitsBase
,   digitsBase
,   fromDigitsBase
,   revDigits
,   digits
,   fromDigits

,   rotations
,   lexicalPermutations

) where

import Data.List (delete, inits, tails)


-- Math ----------------------------------------------------------------------

divides a b = rem b a == 0

maybeSqrt n = let root = round . sqrt . fromIntegral $ n
              in if root * root == n then Just root else Nothing

-- Primes --------------------------------------------------------------------

genericPrimeFactors :: Integral a => a -> [a]
genericPrimeFactors n = pf n genericPrimes
   where pf n pps@(p:ps)
            | p * p > n     = [n]
            | p `divides` n = p : pf (n `div` p) pps
            | otherwise     = pf n ps

genericIsPrime :: Integral a => a -> Bool
genericIsPrime n | n < 2     = False
                  | otherwise = null . tail . genericPrimeFactors $ n

genericPrimes :: Integral a => [a]
genericPrimes = 2 : filter genericIsPrime [3,5..]


primeFactors :: Int -> [Int]
primeFactors = genericPrimeFactors

isPrime :: Int -> Bool
isPrime = genericIsPrime

primes :: [Int]
primes = genericPrimes


-- Digits --------------------------------------------------------------------

revDigitsBase :: Integral a => a -> a -> [a]
revDigitsBase _    0 = []
revDigitsBase base n = let (d,m) = n `divMod` base
                       in m : revDigitsBase base d

digitsBase :: Integral a => a -> a -> [a]
digitsBase base n = reverse $ revDigitsBase base n

fromDigitsBase :: Integral a => a -> [a] -> a
fromDigitsBase base xs = foldl (\a b -> base * a + b) 0 xs


revDigits :: Integral a => a -> [a]
revDigits = revDigitsBase 10

digits :: Integral a => a -> [a]
digits = digitsBase 10

fromDigits :: Integral a => [a] -> a
fromDigits = fromDigitsBase 10


-- List Manipulation ---------------------------------------------------------

rotations xs = tail $ zipWith (++) (tails xs) (inits xs)

lexicalPermutations [] = [[]]
lexicalPermutations xs = concat [ map (x:) . lexicalPermutations . delete x $ xs | x <- xs ]


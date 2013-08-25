module EulerUtils
(
    divides
,   iSqrt
,   maybeSqrt

,   primeFactors
,   isPrime
,   primes
,   primeIntegerFactors
,   isPrimeInteger
,   primeIntegers

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

divides :: Integral a => a -> a -> Bool
divides a b = rem b a == 0

iSqrt :: Integral a => a -> a
iSqrt n = floor . sqrt $ (fromIntegral n :: Double)

maybeSqrt :: Integral a => a -> Maybe a
maybeSqrt n = let root = iSqrt n
              in if root * root == n then Just root else Nothing


-- Primes --------------------------------------------------------------------

genericPrimeFactors :: Integral a => a -> [a]
genericPrimeFactors n | n < 2     = []
                      | otherwise = pf n genericPrimes
   where pf m pps@(p:ps)
            | p * p > m     = [m]
            | p `divides` m = p : pf (m `div` p) pps
            | otherwise     = pf m ps
         pf _ []            = error "Ran out of primes!"

genericIsPrime :: Integral a => a -> Bool
genericIsPrime n = case genericPrimeFactors n of
                      [_] -> True
                      _   -> False

genericPrimes :: Integral a => [a]
genericPrimes = 2 : filter genericIsPrime [3,5..]


primeFactors :: Int -> [Int]
primeFactors = genericPrimeFactors

isPrime :: Int -> Bool
isPrime = genericIsPrime

primes :: [Int]
primes = 2 : filter isPrime [3,5..maxBound]


primeIntegerFactors :: Integer -> [Integer]
primeIntegerFactors = genericPrimeFactors

isPrimeInteger :: Integer -> Bool
isPrimeInteger = genericIsPrime

primeIntegers :: [Integer]
primeIntegers = genericPrimes


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

rotations :: [a] -> [[a]]
rotations xs = tail $ zipWith (++) (tails xs) (inits xs)

lexicalPermutations :: Eq a => [a] -> [[a]]
lexicalPermutations [] = [[]]
lexicalPermutations xs = concat [ map (x:) . lexicalPermutations . delete x $ xs | x <- xs ]


import qualified Data.Set as S
import Data.Array.Unboxed (UArray, listArray, (!))
import EulerUtils (iSqrt)

stop :: Int
stop = 28123

sumOfDivisors :: Int -> Int
sumOfDivisors 1 = 0
sumOfDivisors n = let root = iSqrt n
                      isSquare = root * root == n
                      pairs = sum [ x+d | x <- [2..root]
                                        , let (d, m) = n `divMod` x
                                        , m == 0 ]
                  in 1 + pairs - if isSquare then root else 0


isAbundant :: Int -> Bool
isAbundant n = abArray ! n
   where abArray :: UArray Int Bool
         abArray = listArray (1, stop) $ map abundantCheck [1..stop]
         abundantCheck m = m < sumOfDivisors m

abundants :: [Int]
abundants = filter isAbundant [1..stop]

isAbundantSum :: Int -> Bool
isAbundantSum n = any (\a -> isAbundant (n - a)) $ takeWhile (<=(n-12)) abundants

main :: IO ()
main = print . sum . filter (not . isAbundantSum) $ [1..stop]


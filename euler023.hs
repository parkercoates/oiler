import qualified Data.Set as S
import Data.Array.Unboxed (UArray, listArray, (!))

stop = 28123

sumOfDivisors 1 = 0
sumOfDivisors n = let root = floor . sqrt . fromIntegral $ n
                      isSquare = root * root == n
                      pairs = sum [ x+d | x <- [2..root]
                                        , let (d, m) = n `divMod` x
                                        , m == 0 ]
                  in 1 + pairs - if isSquare then root else 0


isAbundant n = abArray ! n
   where abArray :: UArray Int Bool
         abArray = listArray (1, stop) $ map abundantCheck [1..stop]
         abundantCheck n = n < sumOfDivisors n

abundants = filter isAbundant [1..stop]

isAbundantSum n = any (\a -> isAbundant (n - a)) $ takeWhile (<=(n-12)) abundants

main = print . sum . filter (not . isAbundantSum) $ [1..stop]


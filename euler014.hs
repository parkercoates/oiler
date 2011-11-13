import Data.Array (listArray, (!), assocs)
import Data.List (maximumBy)
import Data.Ord (comparing)

nextNum n | even n    = n `div` 2
          | otherwise = 3 * n + 1

cls n = clsn
   where clsn = listArray (1,n) $ 1:[cl x | x <- [2..n]]
         cl x = let x' = nextNum x
                in 1 + if x' <= n then clsn ! x' else cl x'

main = print . fst . maximumBy (comparing snd) . assocs . cls $ 1000000


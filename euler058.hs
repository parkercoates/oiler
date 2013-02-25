import Data.Function (on)
import Data.List (findIndex)
import Data.Maybe (fromJust)
import EulerUtils (isPrime)

main = print . indexToSideLength . fromJust . findIndex (< 0.10) $ primeCornerFractions
   where indexToSideLength = (+1) . (*2) . (+1)
         primeCornerFractions = zipWith ((/) `on` fromIntegral) primeCornerTotals [5,9..]
         primeCornerTotals = scanl1 (+) . map primeCornerCount $ [3,5..]
         primeCornerCount n = let s = n - 1
                                  bl = n * n - s
                                  tl = bl - s
                                  tr = tl - s
                              in length $ filter isPrime [tr, tl, bl]

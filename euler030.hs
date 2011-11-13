import Data.List (find)
import Data.Maybe (fromJust)
import EulerUtils (revDigits)

main = print . sum $ [ a | a <- [10..upperLimit], powerSum a == a ]
   where power = 5 :: Int
         powerSum = sum . map (^power) . revDigits
         upperLimit = (10 ^) . fromJust $ find isTooBig [1..]
            where isTooBig d = (d * 9 ^ power) < (10 ^ d - 1)



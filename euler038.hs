import Data.Maybe (mapMaybe)
import EulerUtils (digits, fromDigits)

f n = f' [] 1
   where f' ds m | length ds > 9       = Nothing
                 | is1To9Pandigital ds = Just (fromDigits ds)
                 | otherwise           = f' (ds ++ digits (m * n)) (m + 1)
         is1To9Pandigital ds = length ds == 9 && all (`elem` ds) [1..9]

main = print . maximum . mapMaybe f $ [1..9876]


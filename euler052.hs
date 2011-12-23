import Data.List (find)
import Data.Maybe (fromJust)
import EulerUtils (digits)

count y = length . filter (==y)

sameElems xs ys = all (\x -> count x xs == count x ys) xs

main = print . fromJust . find check $ candidates
   where check n = let ds = digits n
                   in (head ds == 1) && all (sameElems ds . digits . (*n)) [2..6]
         candidates = concatMap range [0..]
         range n = let s = 10^n
                       e = floor $ 10 / 6 * fromIntegral s
                   in [s..e]

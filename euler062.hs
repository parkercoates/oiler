import EulerUtils (fromDigits, revDigits)
import Data.List (sort)
import qualified Data.Map as M
import Data.Maybe (fromMaybe)

incrementCount key cube m = let (oldValue, m') = M.insertLookupWithKey f key (cube, 1) m
                                   where f _ _ (c, n) = (c, n + 1)
                                (oldCube, oldCount) = fromMaybe (cube, 0) oldValue
                            in (oldCube, oldCount + 1, m')

search :: Integer -> M.Map Integer (Integer, Int) -> Integer
search i m = let cube = i * i * i
                 key = fromDigits . reverse . sort . revDigits $ cube
                 (oldCube, count, m') = incrementCount key cube m
             in if count == 5 then oldCube else search (i+1) m'


main = print $ search 1 M.empty

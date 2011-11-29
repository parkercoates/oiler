import Data.Maybe (catMaybes)
import qualified Data.Map as M
import EulerUtils (maybeSqrt)


rightTrianglePerimeter a b = fmap (a + b +) $ maybeSqrt (a * a + b * b)

maxKeyValue m = M.foldrWithKey f (0, 0) m
   where f k v acc@(maxK, maxV) = if v > maxV then (k, v) else acc

main = print . fst . maxKeyValue $ freqMap
   where perimeters = filter (<= 1000) $ catMaybes [ rightTrianglePerimeter a b | a <- [1..500], b <- [1..a] ]
         freqMap = M.fromListWith (+) $ zip perimeters (repeat 1)


import Control.Monad (join)
import Data.List (delete, find)
import Data.Maybe (fromJust, fromMaybe, isJust)

calculateCandidates f = takeWhile (<10000) . dropWhile (<1000) . map f $ [1..]

triangles = calculateCandidates (\n -> n * (    n + 1) `quot` 2)
squares   = calculateCandidates (\n -> n *      n              )
pentagons = calculateCandidates (\n -> n * (3 * n - 1) `quot` 2)
hexagons  = calculateCandidates (\n -> n * (2 * n - 1)         )
heptagons = calculateCandidates (\n -> n * (5 * n - 3) `quot` 2)
octagons  = calculateCandidates (\n -> n * (3 * n - 2)         )

findJust = join . find isJust

findCycle (ps:pss) = findJust . map (\c -> search [c] pss) $ ps
 where search (c:cs) []       = if c `rem` 100 == last (c:cs) `quot` 100
                                then Just (c:cs)
                                else Nothing
       search cs     pss      = findJust . map (search' cs pss) $ pss
       search' (c:cs) pss ps = let minValue = c `rem` 100 * 100
                                   maxValue = minValue + 99
                                   next = takeWhile (<=maxValue) . dropWhile (<minValue) $ ps
                                   pss' = delete ps pss
                               in findJust . map (\n -> search (n:c:cs) pss') $ next

main = print . sum . fromJust $ findCycle [triangles, squares, pentagons, hexagons, heptagons, octagons]

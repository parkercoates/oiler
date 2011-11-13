import qualified Data.Map as M
import EulerUtils (primeFactors)

countMap = M.fromListWith (+) . flip zip (repeat 1)

lowestCommonMultiple [] = 0
lowestCommonMultiple xs = let factorCountMaps   = map (countMap . primeFactors) xs
                              combinedFactorMap = foldr1 (M.unionWith max) factorCountMaps
                          in M.foldrWithKey (\k a b -> b * k ^ a) 1 combinedFactorMap

main = print $ lowestCommonMultiple [1..20]

import EulerUtils (divides, iSqrt)

triangles :: [Int]
triangles = scanl1 (+) [1..]

numFactors :: Int -> Int
numFactors n = let root = iSqrt n
                   isSquare = root * root == n
                   halfNumFactors = length $ filter (`divides` n) [1..root]
               in halfNumFactors * 2 - (if isSquare then 1 else 0)

main :: IO ()
main = print . head . dropWhile ((<500) . numFactors) $ triangles

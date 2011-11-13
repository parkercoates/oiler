import EulerUtils (divides)

triangles :: [Int]
triangles = scanl1 (+) [1..]

numFactors :: Int -> Int
numFactors n = let root = round . sqrt . fromIntegral $ n
                   isSquare = root * root == n
                   halfNumFactors = length $ filter (`divides` n) [1..root]
               in halfNumFactors * 2 - (if isSquare then 1 else 0)

main = print . head . dropWhile ((<500) . numFactors) $ triangles

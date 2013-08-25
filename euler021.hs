import EulerUtils (iSqrt)

properDivisors :: Int -> [Int]
properDivisors 1 = []
properDivisors n = let root = iSqrt n
                       isSquare = root * root == n
                       pairs = concat [ [x,d] | x <- [2..root],
                                                let (d,m) = n `divMod` x,
                                                m == 0 ]
                   in 1 : if isSquare then init pairs else pairs

divisorSum :: Int -> Int
divisorSum = sum . properDivisors

isAmicable :: Int -> Bool
isAmicable n = let d = divisorSum n
               in d /= n && divisorSum d == n

main :: IO ()
main = print . sum . filter isAmicable $ [2..9999]


import EulerUtils (divides, maybeSqrt)

isPentagonal1 n = let x = round ((sqrt (fromIntegral (24 * n + 1)) + 1) / 6)
                  in n == (x * (3 * x - 1) `div` 2)

isPentagonal3 n = case maybeSqrt (24 * n + 1) of
                     Just m  -> 6 `divides` (m + 1)
                     Nothing -> False

isPentagonal = isPentagonal3

pentagonals :: [Int]
pentagonals = map (\n -> n * (3 * n - 1) `div` 2) [1..]

takeWhileStepLessThan _ []         = []
takeWhileStepLessThan _ [x]        = [x]
takeWhileStepLessThan s (x1:x2:xs) | x2 <= x1 + s = x1 : takeWhileStepLessThan s (x2:xs)
                                   | otherwise    = []

main1 = print . head $ [ d | s <- pentagonals
                           , a <- takeWhile (<(s `div` 2)) pentagonals
                           , let b = s - a
                           , isPentagonal b
                           , let d = b - a
                           , isPentagonal d ]

main2 = print . head $ [ d | b <- pentagonals
                           , d <- takeWhile (<b) pentagonals
                           , isPentagonal (b - d)
                           , isPentagonal (b + b - d) ]

-- This is the "correct" solution, but it's way too slow.
main3 = print . head $ [ d | d <- pentagonals
                           , a <- takeWhileStepLessThan d pentagonals
                           , isPentagonal (a + d)
                           , isPentagonal (a + a + d) ]

main = main2

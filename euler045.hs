
isPentagonal n = let x = round ((sqrt (fromIntegral (24 * n + 1)) + 1) / 6)
                 in n == (x * (3 * x - 1) `div` 2)

hexagonals :: [Integer]
hexagonals = map (\n -> n * (2 * n - 1)) [144..]

main = print . head . filter isPentagonal $ hexagonals


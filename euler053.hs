
minMax x y | x <= y    = (x, y)
           | otherwise = (y, x)

nChooseR n r = let (mn, mx) = minMax r (n-r)
               in product [(mx+1)..n] `div` product [1..mn]

main = print . length . filter (>=1000000) $ [nChooseR n r | n <- [1..100],
                                                             r <- [1..n] ]



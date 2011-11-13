
change :: Int -> [Int] -> [[Int]]
change 0     _  = [[]]
change total [] = []
change total vvs@(v:vs)
   | v > total = change total vs
   | otherwise = let ifTaken = map (v:) (change (total - v) vvs)
                     ifNotTaken = change total vs
                 in ifTaken ++ ifNotTaken

change2 :: Int -> [Int] -> Int
change2 0     _  = 1
change2 total [] = 0
change2 total vvs@(v:vs)
   | v > total = change2 total vs
   | otherwise = let ifTaken = change2 (total - v) vvs
                     ifNotTaken = change2 total vs
                 in ifTaken + ifNotTaken

main = print $ change2 200 [200, 100, 50, 20, 10, 5, 2, 1]


import EulerUtils (lexicalPermutations)

firstIsSmallest (a:b:c:d:e:_) = a < b && a < c && a < d && a < e
firstIsSmallest _             = False

spokes [a,b,c,d,e,f,g,h,i,j] = [[a,f,g], [b,g,h], [c,h,i], [d,i,j], [e,j,f]]
spokes _                     = []

equalSums xss = allEqual $ map sum xss
   where allEqual (x:xs) = all (== x) xs
         allEqual []     = True

concatDigits :: [[Int]] -> Int
concatDigits = read . concatMap show . concat

main = let magic5gonRings = filter equalSums . map spokes . filter firstIsSmallest . lexicalPermutations $ [1..10]
       in print . maximum . filter (< 10000000000000000) . map concatDigits $ magic5gonRings

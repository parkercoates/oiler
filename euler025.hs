fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = print . fst . head . dropWhile ((< 10^999) . snd) . zip [0..] $ fibs


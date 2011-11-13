import Data.Array ((!), array)
import EulerUtils (revDigits)

fact10 = (!) ar
   where ar = array (0,9) ((0,1) : [ (n, fact n) | n <- [1..9] ])
         fact n = n * (ar ! (n - 1))

curious n = (n ==) . sum . map fact10 . revDigits $ n

main = print . sum $ filter curious [10..upperLimit]
   where upperLimit = head [ s | n <- [1..]
                               , let s = n * fact10 9
                               , 10 ^ n > s ]


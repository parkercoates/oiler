import Data.List (delete)
import EulerUtils (divides, fromDigits)

check = check2
   where check2  ds@(_:a:b:c:_) = dividesDigits 2 a b c && check3 ds
         check2  _ = True
         check3  ds@(_:_:a:b:c:_) = dividesDigits 3 a b c && check5 ds
         check3  _ = True
         check5  ds@(_:_:_:a:b:c:_) = dividesDigits 5 a b c && check7 ds
         check5  _ = True
         check7  ds@(_:_:_:_:a:b:c:_) = dividesDigits 7 a b c && check11 ds
         check7  _ = True
         check11 ds@(_:_:_:_:_:a:b:c:_) = dividesDigits 11 a b c && check13 ds
         check11 _ = True
         check13 ds@(_:_:_:_:_:_:a:b:c:_) = dividesDigits 13 a b c && check17 ds
         check13 _ = True
         check17 ds@(_:_:_:_:_:_:_:a:b:c:_) = dividesDigits 17 a b c
         check17 _ = True
         dividesDigits n a b c = n `divides` (a * 100 + b * 10 + c)

perms r = perms' [] r
   where perms' a [] = [a]
         perms' a r = concat [ perms' a' r' | x <- r
                                            , let a' = a ++ [x]
                                            , check a'
                                            , let r' = delete x r ]

main = print . sum . map fromDigits . perms $ [0..9]


isPalindrome xs = xs == reverse xs

--main = print . maximum . filter (isPalindrome . show) $ [a * b | a <- [100..999] , b <- [100..a]]

euler4 digits p = euler4Helper n n 0
  where n = 10 ^ digits - 1
        euler4Helper i j biggest 
          | i * i < biggest = biggest
          | otherwise       = let k = i * j
                                  biggest' = if p k
                                             then max k biggest
                                             else biggest
                              in if k > biggest'
                                 then euler4Helper i (j-1) biggest'
                                 else euler4Helper (i-1) (i-1) biggest'

main = print $ euler4 3 (isPalindrome . show)

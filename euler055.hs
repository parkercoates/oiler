import EulerUtils (digits, revDigits, fromDigits)

-- isPalindromic n = let rds = revDigits n
--                   in rds == reverse rds
--
-- isLychrel = not . any isPalindromic . take 50 . tail . iterate next
--     where next n = n + fromDigits (revDigits n)


-- isPalindromic ds = ds == reverse ds
--
-- isLychrel = not . any isPalindromic . take 50 . tail . iterate next . digits
--     where next ds = digits $ fromDigits ds + fromDigits (reverse ds)


isPalindromic = uncurry (==)

isLychrel = not . any isPalindromic . take 50 . tail . iterate next . reverseJoin . revDigits
    where reverseJoin ds = (reverse ds, ds)
          next (ds, rds) = reverseJoin $ digitAdd 0 ds rds
          digitAdd 0 []     []     = []
          digitAdd c []     []     = [c]
          digitAdd c ds     []     = digitAdd c ds [0]
          digitAdd c []     rs     = digitAdd c [0] rs
          digitAdd c (d:ds) (r:rs) = let (c',v) = (d + r + c) `quotRem` 10
                                     in v:digitAdd c' ds rs


main = print . length . filter isLychrel $ [1..10000]

import EulerUtils (digits, revDigits, fromDigits)

-- isPalindromic n = let rds = revDigits n
--                   in rds == reverse rds
--
-- isLychrel = not . any isPalindromic . take 50 . tail . iterate next
--     where next n = n + fromDigits (revDigits n)

isPalindromic ds = ds == reverse ds

isLychrel = not . any isPalindromic . take 50 . tail . iterate next . digits
    where next ds = digits $ fromDigits ds + fromDigits (reverse ds)

main = print . length . filter isLychrel $ [1..10000]

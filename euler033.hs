import Data.Ratio ((%), denominator)

main = print . denominator . product $ fracts
   where canSimplify n d = let (n10, n1) = divMod n 10
                               (d10, d1) = divMod d 10
                           in (n10 == d1 && n1 * d == n * d10) || (d10 == n1 && d1 * n == d * n10)
         fracts = [ n % d | d <- [11..99], n <- [11..d-1], canSimplify n d ]


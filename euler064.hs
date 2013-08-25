import EulerUtils (iSqrt)

--sqrtCf :: Int -> [Int]
--sqrtCf n = sqrtCf' 0 1
--   where m = iSqrt n
--         sqrtCf' nt d = let f = div (m + nt) d
--                            nt' = f * d - nt
--                            d' = div (n - nt' * nt') d
--                        in f : sqrtCf' nt' d'

lenSqrtCf :: Integer -> Integer
lenSqrtCf n = if m * m == n
              then 0
              else lenSqrtCf' 0 1 0
   where m = iSqrt n
         lenSqrtCf' _  1 l | l > 0 = l       -- If the denominator is 1, we've looped.
         lenSqrtCf' nt d l = let f = div (m + nt) d
                                 nt' = f * d - nt
                                 d' = div (n - nt' * nt') d
                             in lenSqrtCf' nt' d' (l + 1)

main :: IO ()
main = print . length . filter odd . map lenSqrtCf $ [1..10000]

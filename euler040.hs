import EulerUtils (digits)

-- The simple, inefficient method.
--main = print . product . map (\x -> ds !! (10^x - 1)) $ [0..6]
--   where ds = concatMap digits [1..]


nDigitMaxIndex n = sum . map (\x -> x * 9 * 10^(x-1)) $ [1..n]
-- The pattern is 9, 9+90*2, 9+900*3, etc.

missingDigitOffset n = (n+) . sum . map (\x -> (n - x) * 9 * 10^x) $ [0..n-1]
-- The pattern is 1+9, 2+2*9+90, 3+3*9+2*90+900, etc.

irrationalFractionDigit i = let numDigits = head . dropWhile ((i>).nDigitMaxIndex) $ [1..]
                                (d, m) = (i + missingDigitOffset (numDigits - 1)) `divMod` numDigits
                            in digits d !! m


main = print . product . map (irrationalFractionDigit . (10^)) $ [0..6]


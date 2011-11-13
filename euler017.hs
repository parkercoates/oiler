
onesText 1  = "one"
onesText 2  = "two"
onesText 3  = "three"
onesText 4  = "four"
onesText 5  = "five"
onesText 6  = "six"
onesText 7  = "seven"
onesText 8  = "eight"
onesText 9  = "nine"
onesText 10 = "ten"
onesText 11 = "eleven"
onesText 12 = "twelve"
onesText 13 = "thirteen"
onesText 14 = "fourteen"
onesText 15 = "fifteen"
onesText 16 = "sixteen"
onesText 17 = "seventeen"
onesText 18 = "eighteen"
onesText 19 = "nineteen"
onesText _  = ""

tensText 2 = "twenty"
tensText 3 = "thirty"
tensText 4 = "forty"
tensText 5 = "fifty"
tensText 6 = "sixty"
tensText 7 = "seventy"
tensText 8 = "eighty"
tensText 9 = "ninety"
tensText _ = ""

intToText :: Int -> String
intToText n = let (m,r1) = divMod n 1000
                  (c,r2) = divMod r1 100
                  (x,i) = if r2 >= 20 then divMod r2 10 else (0,r2)
                  mText = if m > 0 then onesText m ++ "thousand" else ""
                  cText = if c > 0 then onesText c ++ "hundred" else ""
                  andText = if (c > 0) && (r2 > 0) then "and" else ""
                  xText = tensText x
                  iText = onesText i
              in mText ++ cText ++ andText ++ xText ++ iText

main = print . sum . map (length . intToText) $ [1..1000]


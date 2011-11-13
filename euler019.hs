import EulerUtils (divides)

isLeapYear y = 4 `divides` y && (not (100 `divides` y) || 400 `divides` y)

daysInMonth y 2  = if isLeapYear y then 29 else 28
daysInMonth _ 4  = 30
daysInMonth _ 6  = 30
daysInMonth _ 9  = 30
daysInMonth _ 11 = 30
daysInMonth _ _  = 31

firsts = firsts' 1900 1 1 0
    where firsts' y m w c | y > 2000  = c
                          | otherwise = let md = daysInMonth y m
                                            w' = (w + md) `mod` 7
                                            m' = (m `mod` 12) + 1
                                            y' = y + if m' == 1 then 1 else 0
                                            c' = c + if w' == 0 && y' >= 1901 then 1 else 0
                                        in firsts' y' m' w' c'

main = print firsts



main = print . head $ [ a * b * c | a <- [1..333]
                                  , b <- [a..(div (1000 - a) 2)]
                                  , let c = 1000 - a - b :: Int
                                  , a*a + b*b == c*c ]

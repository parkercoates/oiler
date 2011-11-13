import Data.List (nub, permutations)
import Data.Maybe (mapMaybe)

main = print . sum . nub . mapMaybe maybeProduct . permutations $ [1, 2, 3, 4, 5, 6, 7, 8, 9]
   where maybeProduct (a:b:c:d:e:f:g:h:i) = let prod = 1000*a + 100*b + 10*c + d
                                                mult1 = e * (1000*f + 100*g + 10*h + i)
                                                mult2 = (10*e + f) * (100*g + 10*h + i)
                                            in if prod == mult1 || prod == mult2 then Just prod else Nothing


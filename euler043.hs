import Data.List (tails, permutations)
import EulerUtils (divides, fromDigits, isPrime)

propertyCheck (_:a:b:c:d:e:f:g:h:i:[]) = 
                                         17 `divides` fromDigits [g,h,i] &&
                                         13 `divides` fromDigits [f,g,h] &&
                                         11 `divides` fromDigits [e,f,g] &&
                                         7 `divides` fromDigits [d,e,f] &&
                                         5 `divides` fromDigits [c,d,e] &&
                                         3 `divides` fromDigits [b,c,d] &&
                                         2 `divides` fromDigits [a,b,c]


main = print . sum . map fromDigits . filter propertyCheck . permutations $ [0..9]


import EulerUtils (revDigits)

main = print . maximum $ [ digitSum (a ^ b) | a <- [2..99], b <- [2..99] ]
    where digitSum = sum . revDigits

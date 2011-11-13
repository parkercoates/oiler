import EulerUtils (revDigitsBase)

isPalindromic xs = xs == reverse xs

isDualPalindrome x = isPalindromic (revDigitsBase 10 x) && isPalindromic (revDigitsBase 2 x)

main = print . sum $ filter isDualPalindrome [1,3..1000000]


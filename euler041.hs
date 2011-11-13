import Data.List (tails)
import EulerUtils (lexicalPermutations, fromDigits, isPrime)

descendingPandigitals = map fromDigits . concatMap lexicalPermutations . tails $ [9,8..1]

main = print . head . filter isPrime $ descendingPandigitals

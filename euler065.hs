import Data.Ratio (Ratio, numerator, (%))
import EulerUtils (revDigits)

eCf :: [Integer]
eCf = 2 : eCf' 1
   where eCf' n = 1 : (2 * n) : 1 : eCf' (n + 1)

cfConvergent :: [Integer] -> Ratio Integer
cfConvergent []     = 0 % 1
cfConvergent [x]    = x % 1
cfConvergent (x:xs) = x % 1 + 1 / cfConvergent xs

main :: IO ()
main = print . sum . revDigits . numerator . cfConvergent . take 100 $ eCf

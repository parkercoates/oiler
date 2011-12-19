import Data.List (delete, find, permutations, sort)
import Data.Maybe (mapMaybe)
import EulerUtils (primes, isPrime, digits, fromDigits)

digitPermutations = map fromDigits . permutations . digits

main = putStr . head . delete "148748178147" . mapMaybe check $ fourDigitPrimes
   where fourDigitPrimes = takeWhile (<10000) . dropWhile (<1000) $ primes
         check n = let primePerms = sort . filter (>n) . filter isPrime . digitPermutations $ n
                   in case find (\m -> (m + m - n) `elem` primePerms) primePerms of
                         Just m  -> Just $ show n ++ show m ++ show (m + m - n)
                         Nothing -> Nothing


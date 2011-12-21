import Data.List (find)
import Data.Maybe (fromJust)
import EulerUtils (digits, fromDigits, isPrime, primes)

replace []     _ _ = []
replace (x:xs) o n | x == o    = n : replace xs o n
                   | otherwise = x : replace xs o n

main = print . fromJust . find checkPrime $ primes
   where checkPrime = any checkTemplate . templates
         checkTemplate = (>=8) . length . filter isPrime . fillTemplate
         fillTemplate ds = map (fromDigits . replace ds (-1)) $ if head ds == -1 then [1..9] else [0..9]
         templates n = let ds = digits n
                       in map (\o -> replace ds o (-1)) ds

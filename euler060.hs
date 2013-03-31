import EulerUtils (isPrime, primes)
import Data.List (find, tails)
import Data.Maybe (fromJust, fromMaybe, isJust)

concatInt x y = x * powerOfTen + y
   where powerOfTen = fromJust . find (>y) . iterate (*10) $ 1

findNextMembers ms ps = filter (isMember ms . head) . init . tails $ ps
   where isMember ms p = all (havePrimeConcats p) ms
         havePrimeConcats x y = isPrime (x `concatInt` y) && isPrime (y `concatInt` x)

search 0 ms _  = Just ms
search _ _  [] = Nothing
search n ms ps = fromMaybe Nothing . find isJust . map recurse $ findNextMembers ms ps
   where recurse (c:ps) = search (n-1) (c:ms) ps

-- The 2000 here is a magic number. Make it bigger and things get very much slower.
-- Make is much smaller and it will fail to find a result. It's ugly, but I don't see
-- a better way.
main = print . sum . fromJust . search 5 [] . take 2000 $ primes



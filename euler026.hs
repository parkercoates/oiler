import Data.List (findIndex, isPrefixOf, tails)
import EulerUtils (digits)

divDigits n m = divDigits' (digits n ++ repeat 0) m
   where divDigits' (n1:n2:ns) m = let (q,r) = divMod n1 m
                                   in q : divDigits' ((r*10+n2):ns) m

search a b = findIndex (isPrefixOf a) (tails b)

findPatternLength [] = 0
findPatternLength xs = fpl 10 3 100 xs
   where fpl skip sample depth xs
             = let ys   = drop skip xs
                   pat  = take sample ys
                   dist = search pat . take depth . tail $ ys
               in case dist of
                     Nothing -> fpl (skip*10) sample (depth*10) ys
                     Just n  -> if check (n+1) ys
                                then n + 1
                                else fpl skip (sample*2) depth ys
         check l xs = let (pat,rest) = splitAt l xs
                          check1 = pat `isPrefixOf` rest
                          check2 = pat `isPrefixOf` drop l rest
                      in check1 && check2

unitFractionRepLength = findPatternLength . divDigits 1

main = print . snd . maximum . map f $ [1..999]
   where f n = (findPatternLength (divDigits 1 n), n)


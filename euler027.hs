import Data.List (find)
import Data.Maybe (fromJust)
import EulerUtils (isPrime)


maxCoeff = 999

primePatternLength a b = fromJust (find check [0..])
   where check n = not . isPrime $ n*n + a*n + b 

main = print . snd . maximum $ [ (primePatternLength a b, a*b) | a <- rng, b <- rng ]
   where rng = [ 0-maxCoeff, 2-maxCoeff .. maxCoeff ]

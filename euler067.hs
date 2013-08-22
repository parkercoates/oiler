import Data.Array (Array, Ix, array, bounds, (!))
import qualified Data.ByteString.Char8 as B
import Data.Maybe (mapMaybe)

listGridToArray :: (Ix a, Integral a) => a -> a -> [[b]] -> Array (a,a) b
listGridToArray n m xss = array ((1,1),(n,m)) . concat . zipWith addIndex [1..n+1] $ xss
   where addIndex r = zipWith (\c x -> ((r,c),x)) [1..m+1]

stringToGrid :: B.ByteString -> Array (Int,Int) Int
stringToGrid str = let lists = map (map fst . mapMaybe B.readInt . B.words) . B.lines $ str
                       rows = length lists
                   in listGridToArray rows rows lists

maxPath :: Array (Int,Int) Int -> Int
maxPath grid = let ixs@((_,_),(rows,_)) = bounds grid
                   maxPaths = array ixs [ ((r,c), grid ! (r,c) + subPath r c) | r <- [1..rows], c <- [1..r] ]
                      where subPath r c | r == rows = 0
                                        | otherwise = max (maxPaths ! (r+1,c)) (maxPaths ! (r+1,c+1))
               in maxPaths ! (1,1)

main :: IO ()
main = do raw <- B.readFile "euler067.data"
          print . maxPath . stringToGrid $ raw


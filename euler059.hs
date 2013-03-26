import Data.Bits (xor)
import qualified Data.ByteString.Char8 as B
import Data.Char (chr, ord)
import Data.List (find, isInfixOf)
import Data.Maybe (fromJust, mapMaybe)

bruteSearch :: [Int] -> B.ByteString
bruteSearch encoded = fromJust . find (B.isInfixOf $ B.pack " the ") $ decodings
   where decodings = map (xorDecode encoded) keys
         keys = [ [a, b, c] | a <- alpha, b <- alpha, c <- alpha ]
         alpha = [ord 'a'.. ord 'z']
         xorDecode text key = B.pack . zipWith charXor text $ cycle key
         charXor = (chr .) . xor

main = do string <- B.readFile "euler059.data"
          let encoded = map fst . mapMaybe B.readInt . B.split ',' $ string
          print . sum . map ord . B.unpack . bruteSearch $ encoded

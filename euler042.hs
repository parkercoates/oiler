import qualified Data.Set as S

main = do wordData <- readFile "euler042.data"
          let words = read ("[" ++ wordData ++ "]") :: [String]
          print . length . filter (`S.member` triangles) . map wordScore $ words
             where wordScore = sum . map letterScore
                   letterScore c = fromEnum c - (fromEnum 'A' - 1)
                   triangle n = n * (n + 1) `div` 2
                   triangles = S.fromList . map triangle $ [1..26]

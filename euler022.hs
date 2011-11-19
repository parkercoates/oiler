import Data.List (sort)

main = do nameData <- readFile "euler022.data"
          let names = read ("[" ++ nameData ++ "]") :: [String]
          print . sum . zipWith wordScore [1..] . sort $ names
             where wordScore n w = n * sum (map letterScore w)
                   letterScore c = fromEnum c - (fromEnum 'A' - 1)


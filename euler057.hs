import Data.Function (on)

main = print . length . filter longerNumberator . take 1000 . iterate next $ (3, 2)
    where next (n, d) = (d + d + n, d + n)
          longerNumberator = uncurry ((>) `on` length . show)

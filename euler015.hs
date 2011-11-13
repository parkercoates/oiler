import Data.Array (listArray, (!))

pathCount x y = grid ! (x, y)
   where grid = listArray ((0,0),(x,y)) [pc a b | a <- [0..x], b <- [0..y]]
         pc 0 _ = 1
         pc _ 0 = 1
         pc x y = grid ! (x-1, y) + grid ! (x, y-1)

main = print $ pathCount 20 20



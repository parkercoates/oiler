
main = print . sum . map layerTotal $ [1,3..sideLength]
   where sideLength = 1001
         layerTotal 1 = 1
         --layerTotal n = (n*n-3*(n-1)) + (n*n-2*(n-1)) + (n*n-(n-1)) + (n*n)
         layerTotal n = (4 * n - 6) * n + 6


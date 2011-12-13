import EulerUtils (isPrime)

--isPrimeAndTwiceSquare n = any isPrime . takeWhile (>1) . map (\i -> n - 2 * i * i) $ [1..]
isPrimeAndTwiceSquare n = any (\i -> isPrime (n - 2 * i * i)) [1..n]

main = print . head . dropWhile isPrimeAndTwiceSquare . filter (not . isPrime) $ [3,5..]


import EulerUtils (isPrime, primes, digits, fromDigits, rotations)

digitRotations = map fromDigits . rotations . digits

circularPrime = all isPrime . digitRotations

main = print . length . filter circularPrime . takeWhile (<1000000) $ primes


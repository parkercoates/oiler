import EulerUtils (primeIntegerFactors)

main = print . last . primeIntegerFactors $ 600851475143


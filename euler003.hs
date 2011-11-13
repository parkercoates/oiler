import EulerUtils (genericPrimeFactors)

main = print . last . genericPrimeFactors $ 600851475143


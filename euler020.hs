import EulerUtils (digits)

main = print . sum . digits . product $ [1..100]


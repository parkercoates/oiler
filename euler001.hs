import EulerUtils (divides)

multipleOf3Or5 n = 3 `divides` n || 5 `divides` n

main = print . sum . filter multipleOf3Or5 $ [1..999]


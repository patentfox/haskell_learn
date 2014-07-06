applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' func (x:xs) (y:ys) = 
    (func x y):(zipWith' func xs ys)

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = (f x) : (map' f xs)

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    | f x == True = x:(filter' f xs)
    | otherwise = filter' f xs

-- largest number under 100,000 divisible by 3289
largestDivisible :: (Integral a) => a
largestDivisible = head (filter f [10000000,9999999..])
    where f x = mod x 3289 == 0

-- sum of all odd sqaures smaller than 10,000
sumSquares :: (Integral a) => a
sumSquares = sum (takeWhile (< 10000) (map (^2) [1,3..]))

-- check numbers below 100, whose collatz chain is larger than 15 
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x 
    | odd x = x : (chain (3*x + 1))
    | otherwise = x : (chain (x `div` 2))

collatz :: (Integral a) -> a -> Int
collatz x = length (filter isLong (map chain [1..x]))
          where isLong xs = (length xs) > 15
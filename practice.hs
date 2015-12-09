import qualified Geometry.Sphere as GS

volumn = GS.volume 5.0

doubleSmallNumber x = if x > 100
                        then x
                        else x*2
i :: Int
i = -78

sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n-1)


isEven :: Integer -> Bool
isEven n = mod n 2 == 0

sumPair :: (Int, Int) -> Int
sumPair (x,y) = x + y

funcA :: a -> a
funcA x = x

-- pattern matching
add :: Int -> Int -> Int
add 1 1 = 1
add 1 2 = 3
add 3 _ = 6
add x y = x + y


{-
bmiTell :: Double -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight"
    | bmi <= 25.0 = "You're supposed normal"
    | bmi <= 30.0 = "You're fat"
    | otherwise = "You're a whale"
-}

{-
bmiTell :: Double -> Double -> String
bmiTell weight height
    | weight/height^2 <= 18.5 = "You're underweight"
    | weight/height^2 <= 25.0 = "You're supposed normal"
    | weight/height^2 <= 30.0 = "You're fact"
    | otherwise = "You're a whale"
-}

{-
bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= 18.5 = "You're underweight"
    | bmi <= 25.0 = "You're supposed normal"
    | bmi <= 30.0 = "You're fat"
    | otherwise = "You're a whale"
    where bmi = weight / height ^ 2
-}

{-
bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight"
    | bmi <= normal = "You're supposed normal"
    | bmi <= fat = "You're fat"
    | otherwise = "You're a whale"
    where bmi = weight / height ^ 2
          skinny = 18.0
          normal = 25.0
          fat = 30.0
-}

bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight"
    | bmi <= normal = "You're supposed normal"
    | bmi <= fat = "You're fat"
    | otherwise = "You're a whale"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.0, 25.0, 30.0)

sameBmi :: Double -> Double -> Double
sameBmi weight height = 2 * bmi weight height where bmi x y = x / y ^ 2

amax :: (Ord a) => a -> a -> a
amax x y = if x > y then x else y

initials :: String -> String -> String
initials firstName secondName = [f] ++  ". " ++ [s]
    where (f:_) = firstName
          (s:_) = secondName

initialsB :: String -> String -> String
initialsB (f:_) (s:_) = [f] ++ ". " ++ [s]

aCylinder :: Double -> Double -> Double
aCylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

mySum :: Int -> Int -> Int
mySum lower upper
    | lower < 0 || upper < 0 = -1
    | lower > upper = -1
    | lower == upper = lower
    | otherwise = upper + mySum lower (upper-1)

noParameter :: String
noParameter = "no return"

noReturn :: String -> ()
noReturn s = ()

-- recursion practice
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x $ maximum' xs

replicate' :: Int -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x : replicate' (n-1) x

take' :: Int -> [a] -> [a]
take' _ [] = []
take' n _
    | n <= 0 = []
take' n (x:xs) = x : take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elm' :: (Eq a) => a -> [a] -> Bool
elm' _ [] = False
elm' input (x:xs)
    | input == x = True
    | otherwise = elm' input xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let left = [y | y <-xs, y <= x]
        right = [y | y <-xs, y > x]
    in
        quicksort left ++ [x] ++ quicksort right

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipwith' :: (a->b->c) -> [a] -> [b] -> [c]
zipwith' _ [] _ = []
zipwith' _ _ [] = []
zipwith' f (x:xs) (y:ys) = f x y : zipwith' f xs ys

flip' :: (a->b->c) -> (b->a->c)
flip' f = g
    where g x y = f y x

map' :: (a->b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f(x) : map' f xs

filter' :: (a->Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    | f x = x : filter' f xs
    | otherwise = filter' f xs

largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

-- fold practice
sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs

-- define own data type
data Shape = Circle Float Float Float | Rectangle Float Float Float Float

aCircle = Circle 10.1 9.8 10.9
aRectangle = Rectangle 10 10 10 10

-- pattern match against Constructors
area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x1 y1 x2 y2) = (abs $ x1 - y1) * (abs $ x2 - y2)

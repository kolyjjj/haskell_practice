-- main = putStrLn "hello, world"
{-
printHello :: IO ()
printHello = putStrLn "hello"
-}

{-
main = do
    printHello
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn ("Welcome on board, " ++ name)
-}

reverseWords :: String -> String
reverseWords [] = []
reverseWords (x:xs) = (reverseWords xs) ++ [x]

main = do
    putStrLn "print a line and it will be reversed"
    line <- getLine
    if null line
    then return "exit"
    else do
        putStrLn $ reverseWords line
        main
--import System.Environment
--import System.IO
--import Control.Exception
import Data.Char
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

--reverseWords :: String -> String
--reverseWords [] = []
--reverseWords (x:xs) = (reverseWords xs) ++ [x]
--
--main = do
--    putStrLn "print a line and it will be reversed"
--    line <- getLine
--    if null line
--    then return "exit"
--    else do
--        putStrLn $ reverseWords line
--        main

--main = do
--    putStrLn "hello "
--    putStr "this is a good sign  ====  "
--    putChar 'a'
--    print [1,2,3]

--shortLinesOnly :: String -> String
--shortLinesOnly = unlines . filter (\x -> (length x) > 20) . lines
--
--main = do
--    putStrLn "What's your name?"
--    line <- getContents
--    putStrLn $ shortLinesOnly line

--main = do
--    rs <- sequence [getLine, getLine, getLine]
--    print rs

--main = do
--    args <- getArgs
--    name <- getProgName
--    print args
--    print name
--main = do
--    handle <- openFile "girlfriend.txt" ReadMode
--    contents <- hGetContents handle
--    putStr contents
--    hClose handle

--main = do
--    withFile "girlfriend.txt" ReadMode (\handle -> do
--        contents <- hGetContents handle
--        putStr contents)

--main = do
--    bracket (openFile "girlfriend.txt" ReadMode)
--        (\handle -> hClose handle)
--        (\handle -> do
--                    contents <- hGetContents handle
--                    putStr contents)

main = do
    contents <- readFile "girlfriend.txt"
    writeFile "girlfriendcaps.txt" (map toUpper contents)
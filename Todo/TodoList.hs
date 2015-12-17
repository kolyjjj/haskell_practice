
module TodoList (
add,
view,
remove
) where

import Data.List
import System.Directory
import System.IO
import System.IO.Error

add :: FilePath -> String -> IO ()
add fs xs = do
    appendFile fs (xs ++ "\n")

view :: FilePath -> IO ()
view fs = do
    input <- tryIOError (readFile fs)
    case input of
        Left e -> putStrLn ("cannot open file with" ++ fs)
        Right contents ->
            do
            let newContents = unlines $ zipWith (\n line -> (show n) ++ " - " ++ line) [0,1..] (lines contents)
            putStrLn newContents

remove :: FilePath -> Int -> IO ()
remove fs lineNumber = do
    contents <- readFile fs
    let contentArray = lines contents
        newContent = unlines (delete (contentArray !! lineNumber) contentArray)
    removeFile fs
    appendFile fs newContent
    view fs
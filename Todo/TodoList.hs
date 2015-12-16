
module TodoList (
add,
view,
remove
) where

import Data.List
import System.Directory

add :: FilePath -> String -> IO ()
add fs xs = do
    appendFile fs (xs ++ "\n")

view :: FilePath -> IO ()
view fs = do
    contents <- readFile fs
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
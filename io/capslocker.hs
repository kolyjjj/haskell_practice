import Control.Monad
import Data.Char

--ever :: IO String -> IO ()
--ever line = forever $ do
--  l <- line
--  putStrLn $ map toUpper l
--
--contents :: IO String -> IO ()
--contents line = do
--  l <- line
--  putStrLn $ map toUpper l

--main = ever getLine
--main = contents getContents
main = do
    contents <- getContents
    putStr $ map toUpper contents
import Control.Monad
import Data.Char

ever :: IO String -> IO ()
ever line = forever $ do
  l <- line
  putStrLn $ map toUpper l

main = ever getLine

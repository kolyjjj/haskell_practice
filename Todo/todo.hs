{-
Todo requirements:
* add one item into file: ./todo filename add "This is a todo item"
* delete one item: ./todo filename delete 0
* show all: ./todo filename show
-}
import System.Environment
import TodoList

dispatch :: String -> FilePath -> String -> IO ()
dispatch "add" fs s = add fs s
dispatch "view" fs _ = view fs
dispatch "remove" fs s= remove fs (read s)

main = do
    (fileName : (command:xs)) <- getArgs
    dispatch command fileName (head xs)


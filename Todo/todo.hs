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
dispatch c _ _ = putStrLn $ "cannot find command"++c++". Allowed commands are: view, add, remove"

main = do
    args <- getArgs
    let len = length args
    if (len >= 2)
        then dispatch (args !! 1) (args !! 0) (if (len >2) then args !! 2 else [])
        else putStrLn "missing arguments.<filePath><command>[message]"


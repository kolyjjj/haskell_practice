import qualified Data.Map as DMap
import Control.Monad


data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type Locker = (LockerState, Code)
type LockerMap = DMap.Map Int Locker

initialLockers :: LockerMap
initialLockers = DMap.fromList
    [
      (101, (Free, "JK234")),
      (102, (Free, "YU789")),
      (103, (Free, "HG123")),
      (104, (Free, "VN876")),
      (105, (Free, "CH909"))
    ]

lockerLookup :: Int -> LockerMap -> Maybe Code
lockerLookup n l = case DMap.lookup n l of
    Nothing -> Nothing
    Just (Taken, code) -> Nothing
    Just (Free, code) -> return code

getOneFreeLocker :: LockerMap -> Maybe (Int, Locker)
getOneFreeLocker l = if DMap.null newMap
    then Nothing
    else Just (key, locker)
    where newMap = DMap.filter (\(state, _) -> state == Free) l
          firstElem = head $ DMap.toList newMap
          key = fst firstElem
          locker = snd firstElem

takeLocker :: Int -> Code -> LockerMap -> Maybe LockerMap
takeLocker number code old = case DMap.lookup number old of
    Nothing -> Nothing
    Just (state, c) ->
        if (state == Free && c == code)
        then Just $ DMap.adjust (\(s, c)->(Taken, c)) number old
        else Nothing

process :: LockerMap -> IO ()
process lockers = do
    putStrLn "Welcome to lockers system, enter l and press enter to get an available locker. Enter quit to quit program."
    print lockers
    command <- getLine
    when (command /= "quit") $ do
        case getOneFreeLocker lockers of
            Nothing -> do
                putStrLn "No locker is available"
                process lockers
            Just (key, (_, code)) -> do
                putStrLn $ "The available locker is: " ++ (show key) ++ " - " ++ code
                putStrLn "Do you want to take it?(yes/no)"
                decision <- getLine
                case decision of
                    "yes" -> case takeLocker key code lockers of
                                Nothing -> process lockers
                                Just ls -> process ls
                    "no" -> process lockers
                    _ -> process lockers



--        putStrLn "input the number you want to take"
--        number <- getLine
--        putStrLn "input the code for the locker"
--        code <- getLine
--        case takeLocker (read number) code lockers of
--            Nothing -> do process lockers
--            Just ls -> process ls


main = process initialLockers
--main = do
--    putStrLn "Welcome to lockers system, enter l and press enter to get an available locker. Enter quit to quit program."
--    command <- getLine
--    when (command /= "quit") $ do
--        case getOneFreeLocker lockers of
--                Nothing -> putStrLn "No locker is available"
--                Just (key, (_, code)) -> do
--                    putStrLn $ "The available locker is: " ++ (show key) ++ " - " ++ code
--                    putStrLn "Do you want to take it?(yes/no)"
--                    decision <- getLine
--                    case decision of
--                        "yes" -> takeLocker key code lockers
--                        "no" ->
--                        _ -> "wrong answer. Either yes or no."
--        main

import qualified Data.Map as DMap
import Control.Monad


data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type Locker = (LockerState, Code)
type LockerMap = DMap.Map Int Locker

lockers :: LockerMap
lockers = DMap.fromList
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

getOneFreeLocker :: LockerMap -> String
getOneFreeLocker l = if DMap.null newMap
    then "No free locker"
    else "locker ID: " ++ (show key) ++ ", and code: " ++ code
    where newMap = DMap.filter (\(state, _) -> state == Free) l
          firstElem = head $ DMap.toList newMap
          key = fst firstElem
          code = snd $ snd firstElem

takeLocker :: Int -> Code -> LockerMap -> Maybe LockerMap
takeLocker number code old = case DMap.lookup number old of
    Nothing -> Nothing
    Just (state, c) ->
        if (state == Free && c == code)
        then Just $ DMap.adjust (\(s, c)->(Taken, c)) number old
        else Nothing

main = do
    putStrLn "Welcome to lockers system, enter l and press enter to get an available locker. Enter quit to quit program."
    command <- getLine
    when (command /= "quit") $ do
        putStrLn $ getOneFreeLocker lockers
        main

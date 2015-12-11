import Data.List
import Data.Char
import qualified Data.Map as D

wordCount = words "hey, these are the words in this sentence"
wordsGroup = group ["boom", "bip", "boom", "bip"]

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

caesarEncode :: Int -> String -> String
caesarEncode num = map (\x -> chr $ ord x + num)

caesarDecode :: Int -> String -> String
caesarDecode num = caesarEncode (negate num)

originalCodes = caesarDecode 5 $ caesarEncode 5 "hello, Caesar"

phoneBook :: D.Map String String
phoneBook = D.fromList $
    [
        ("betty", "555-2923"),
        ("putin", "255-2923"),
        ("bejing", "355-2923"),
        ("bella", "455-2923")
    ]

normalPhoneBook :: [(String, String)]
normalPhoneBook = [
       ("betty", "555-2923"),
       ("putin", "255-2923"),
       ("bejing", "355-2923"),
       ("bella", "455-2923")
    ]

findByKey :: String -> [(String, String)] -> String
findByKey s = snd . head . filter (\(x, y) -> x == s)
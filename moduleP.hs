import Data.List
import Data.Char

wordCount = words "hey, these are the words in this sentence"
wordsGroup = group ["boom", "bip", "boom", "bip"]

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

caesarEncode :: Int -> String -> String
caesarEncode num = map (\x -> chr $ ord x + num)

caesarDecode :: Int -> String -> String
caesarDecode num = caesarEncode (negate num)

originalCodes = caesarDecode 5 $ caesarEncode 5 "hello, Caesar"
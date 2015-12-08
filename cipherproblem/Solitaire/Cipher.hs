module Solitaire.Cipher
(
encrypt,
decrypt
)
where

import Data.Char as DChar

append_char :: Char
append_char = 'X'

discard :: String -> String
discard input = [x | x <- input, (x < 'z' && x > 'a') || (x <= 'Z' && x >='A')]

toUpperCase :: String -> String
toUpperCase [] = []
toUpperCase (x:xs) = [DChar.toUpper x] ++ toUpperCase xs

appendX :: String -> String
appendX input
    | remainder == 0 = input
    | otherwise = input ++ replicate (5-remainder) 'X'
    where
    len = length input
    remainder = len `mod` 5

insertSpace :: Int -> String -> String
insertSpace 0 s =  s
insertSpace _ [] = []
insertSpace position s
    | position >= length s = s
    | otherwise = fst splitResult ++ [' '] ++ insertSpace position (snd splitResult)
    where splitResult = splitAt position s

encrypt :: String -> String
encrypt input = insertSpace 5 (appendX(toUpperCase (discard input)))

decrypt :: String -> String
decrypt input = input
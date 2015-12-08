module Solitaire.Cipher
(
encrypt,
decrypt
)
where

import Data.Char as DChar

discard :: String -> String
discard input = [x | x <- input, (x < 'z' && x > 'a') || (x <= 'Z' && x >='A')]

toUpperCase :: String -> String
toUpperCase [] = []
toUpperCase (x:xs) = [DChar.toUpper x] ++ toUpperCase xs

encrypt :: String -> String
encrypt input = discard(input)

decrypt :: String -> String
decrypt input = input
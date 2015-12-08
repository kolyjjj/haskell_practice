module Solitaire.Cipher
(
encrypt,
decrypt
)
where

discard :: String -> String
discard input = [x | x <- input, (x < 'z' && x > 'a') || (x <= 'Z' && x >='A')]

encrypt :: String -> String
encrypt input = discard(input)

decrypt :: String -> String
decrypt input = input
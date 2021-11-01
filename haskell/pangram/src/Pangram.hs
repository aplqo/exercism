module Pangram (isPangram) where

import Data.Bits
import Data.Char

isPangram :: String -> Bool
isPangram text =
  foldr
    ( \c set ->
        if isAlpha c
          then setBit set (ord (toUpper c) - ord 'A')
          else set
    )
    (0 :: Int)
    text
    == 0x3ffffff

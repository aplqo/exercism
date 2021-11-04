module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate xs = map (toUpper . snd) $ filter check $ zip (' ' : xs) xs
  where
    check (pre, cur)
      | isUpper cur = not $ isUpper pre
      | isLower cur = not (isAlpha pre || pre == '\'')
      | otherwise = False

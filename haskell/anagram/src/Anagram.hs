module Anagram (anagramsFor) where

import Data.Char
import Data.Map (Map, empty, insertWith)

countLetter :: String -> Map Char Int
countLetter = foldl (\s c -> insertWith (+) c 1 s) empty

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss =
  let lowx = toLow xs
      letters = countLetter lowx
   in map fst $
        filter (\(_, lx) -> (lx /= lowx) && (countLetter lx == letters)) $
          map (\x -> (x, toLow x)) xss
  where
    toLow = map toLower

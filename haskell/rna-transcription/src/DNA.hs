module DNA (toRNA) where

import Data.List (find)

toRNA :: String -> Either Char String
toRNA xs =
  case valid xs of
    Just c -> Left c
    Nothing -> Right $ map transcribe xs
  where
    transcribe t =
      case t of
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
    valid = find (`notElem` "GCTA")

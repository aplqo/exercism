module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor x
  | null xs = "Fine. Be that way!"
  | isYell =
    if last xs == '?'
      then "Calm down, I know what I'm doing!"
      else "Whoa, chill out!"
  | last xs == '?' = "Sure."
  | otherwise = "Whatever."
  where
    xs = filter (not . isSpace) x
    isYell =
      foldl
        ( \(ext, al) c ->
            if isLetter c
              then (True, al && isUpper c)
              else (ext, al)
        )
        (False, True)
        xs
        == (True, True)

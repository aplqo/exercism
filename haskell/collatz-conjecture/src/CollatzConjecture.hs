module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x
  | x > 0 = Just $ iter x 0
  | otherwise = Nothing
  where
    iter :: Integer -> Integer -> Integer
    iter 1 n = n
    iter i n
      | odd i = iter (3 * i + 1) (n + 1)
      | otherwise = iter (i `div` 2) (n + 1)

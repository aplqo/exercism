module Luhn (isValid) where

import Data.Char (digitToInt, isNumber, isSpace)

double :: Int -> Int
double x =
  if x < 5
    then 2 * x
    else 2 * x - 9

luhn :: [Int] -> Int
luhn [] = 0
luhn [x] = x
luhn (x : y : xs) = x + double y + luhn xs

isValid :: String -> Bool
isValid n =
  let trim = filter (not . isSpace) n
   in all isNumber trim && length trim > 1
        && (luhn . reverse . map digitToInt) trim `mod` 10 == 0

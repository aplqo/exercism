module Grains (square, total) where

import Data.Bits

pow2 :: Int -> Integer
pow2 = shiftL (1 :: Integer)

square :: Integer -> Maybe Integer
square n
  | n > 0 && n <= 64 = Just $ pow2 $ fromInteger (n -1)
  | otherwise = Nothing

total :: Integer
total = pow2 64 - 1

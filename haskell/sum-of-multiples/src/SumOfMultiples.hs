module SumOfMultiples (sumOfMultiples) where

import Data.Set hiding (foldl)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ foldl addMultiplyOf empty factors
  where
    addMultiplyOf s 0 = s
    addMultiplyOf s factor = foldl (flip insert) s [factor, factor * 2 .. limit -1]

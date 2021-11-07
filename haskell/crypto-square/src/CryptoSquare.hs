module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose)
import GHC.Float.RealFracMethods (int2Double)

normalize :: String -> String
normalize = map toLower . filter isAlphaNum

rows :: Int -> Int -> String -> [String]
rows col row xs = groupRows row (xs ++ repeat ' ')
  where
    groupRows :: Int -> String -> [String]
    groupRows 0 _ = []
    groupRows l s =
      let (x, xs) = splitAt col s
       in x : groupRows (l - 1) xs

rectangle ::
  Int ->
  -- | (column, row)
  (Int, Int)
rectangle 0 = (0, 0)
rectangle il =
  let l = int2Double il
      c = ceiling $ sqrt l
   in (c, ceiling $ l / int2Double c)

encode :: String -> String
encode xs =
  let norm = normalize xs
      (col, row) = rectangle $ length norm
   in unwords $ transpose $ rows col row norm

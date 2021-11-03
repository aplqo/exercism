module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

data Count = Count
  { a :: Int,
    t :: Int,
    g :: Int,
    c :: Int
  }

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  if any (`notElem` "ATGC") xs
    then Left "error"
    else
      let cnt = count xs
       in Right $
            fromList
              [ (A, a cnt),
                (T, t cnt),
                (G, g cnt),
                (C, c cnt)
              ]
  where
    count d =
      foldl
        ( \cnt x -> case x of
            'A' -> cnt {a = a cnt + 1}
            'T' -> cnt {t = t cnt + 1}
            'G' -> cnt {g = g cnt + 1}
            'C' -> cnt {c = c cnt + 1}
        )
        Count {a = 0, t = 0, g = 0, c = 0}
        d

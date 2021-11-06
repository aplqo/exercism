module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock {hour :: Int, minute :: Int}
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m =
  Clock
    { hour = (h + (m `div` 60)) `mod` 24,
      minute = m `mod` 60
    }

toString :: Clock -> String
toString Clock {hour = h, minute = m} = toStr h ++ (':' : toStr m)
  where
    toStr i
      | i == 0 = "00"
      | i < 10 = '0' : show i
      | otherwise = show i

addDelta :: Int -> Int -> Clock -> Clock
addDelta h min c = fromHourMin (hour c + h) (minute c + min)

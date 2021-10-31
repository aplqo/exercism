module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year =
  divisible 400
    || ( divisible 4 && not (divisible 100)
       )
  where
    divisible m = year `mod` m == 0

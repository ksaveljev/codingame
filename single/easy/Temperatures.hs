{-# LANGUAGE ScopedTypeVariables #-}

import System.IO
import Control.Exception (IOException, handle)
import Control.Monad (liftM)

readN :: IO String
readN = handle (\(_ :: IOException) -> return "0") getLine

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    -- Auto-generated code below aims at helping you parse
    -- the standard input according to the problem statement.
    
    input_line <- readN
    let n = read input_line :: Int -- the number of temperatures to analyse
    temps :: [Int] <- if n == 0 then return [] else liftM (fmap read . words) getLine
    -- the N temperatures expressed as integers ranging from -273 to 5526
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- Write answer to stdout
    let answer =
          if n == 0
            then 0
            else findTemperature temps

    print answer

findTemperature :: [Int] -> Int
findTemperature [x] = x
findTemperature (x:xs) = findNearestToZero x xs
  where findNearestToZero nearest [] = nearest
        findNearestToZero nearest (y:ys)
          | abs nearest < abs y = findNearestToZero nearest ys
          | abs nearest == abs y = if nearest < 0 then y else nearest
          | otherwise = findNearestToZero y ys

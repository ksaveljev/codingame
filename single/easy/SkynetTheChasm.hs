{-# LANGUAGE ScopedTypeVariables #-}

import System.IO
import Control.Monad (liftM)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    -- Auto-generated code below aims at helping you parse
    -- the standard input according to the problem statement.
    
    r :: Int <- liftM read getLine
    g :: Int <- liftM read getLine
    l :: Int <- liftM read getLine

    loop r g l

loop :: Int -> Int -> Int -> IO ()
loop r g l = do
    s :: Int <- liftM read getLine -- current speed
    x :: Int <- liftM read getLine -- position on the road

    -- The problem statement simplifies everything by saying that:
    --
    -- This problem is quite simple. As quickly as possible, reach the
    -- minimum speed to jump the gap and you’ll be sure to succeed all the
    -- validation tests - no matter your initial position.

    let action =
          if x == r - 1
            then "JUMP"
            else if x < r - 1
                   then if s <= g
                          then "SPEED"
                          else if s > g + 1
                                 then "SLOW"
                                 else "WAIT"
                   else "SLOW"

    -- hPutStrLn stderr "Debug messages..."
    
    -- A single line containing one of 4 keywords: SPEED, SLOW, JUMP, WAIT.
    putStrLn action
    
    loop r g l

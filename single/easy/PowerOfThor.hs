import System.IO
import Control.Monad (unless)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    -- Auto-generated code below aims at helping you parse
    -- the standard input according to the problem statement.
    
    input_line <- getLine
    let input = words input_line
    let lx = read (head input) :: Int -- the X position of the light of power
    let ly = read (input!!1) :: Int -- the Y position of the light of power
    let tx = read (input!!2) :: Int -- Thor's starting X position
    let ty = read (input!!3) :: Int -- Thor's starting Y position
    loop lx ly tx ty

direction :: Int -> Int -> Int
direction current destination
  | current == destination = 0
  | current < destination = 1
  | otherwise = -1

loop :: Int -> Int -> Int -> Int -> IO ()
loop lx ly tx ty = do
    input_line <- getLine
    let e = read input_line :: Int -- The level of Thor's remaining energy, representing the number of moves he can still make.
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- A single line providing the move to be made: N NE E SE S SW W or NW
    let dir = (direction tx lx, direction ty ly)
        next_step =
          case dir of
            (-1, -1) -> "NW"
            (-1,  0) -> "W"
            (-1,  1) -> "SW"
            ( 0, -1) -> "N"
            ( 0,  1) -> "S"
            ( 1, -1) -> "NE"
            ( 1,  0) -> "E"
            ( 1,  1) -> "SE"
            _        -> ""

    unless (null next_step) $ putStrLn next_step
    
    loop lx ly (tx + fst dir) (ty + snd dir)

import System.IO
import Data.List (maximumBy)
import Control.Monad

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    -- Auto-generated code below aims at helping you parse
    -- the standard input according to the problem statement.
    
    loop

loop :: IO ()
loop = do
    input_line <- getLine
    let input = words input_line
    let sx = read (head input) :: Int
    let sy = read (input!!1) :: Int
    
    mountains <- replicateM 8 $ do
        mountain_info <- getLine
        let mh = read mountain_info :: Int -- represents the height of one mountain, from 9 to 0. Mountain heights are provided from left to right.
        return mh
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- either:  FIRE (ship is firing its phase cannons) or HOLD (ship is not firing).
    let (index, _) = maximumBy (\(_, h1) (_, h2) -> if h1 < h2 then LT else GT) (zip [0..] mountains)
    putStrLn $ if index == sx then "FIRE" else "HOLD"
    
    loop

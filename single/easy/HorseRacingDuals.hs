import Control.Monad (replicateM)
import Data.List     (sortBy, minimum, zipWith)
import System.IO     (hSetBuffering, stdout, BufferMode(..))

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE

    n <- fmap read getLine :: IO Int
    horses <- fmap (sortBy (flip compare)) (replicateM n (fmap read getLine :: IO Int))
    putStrLn (show (minimum (zipWith (-) horses (tail horses))))

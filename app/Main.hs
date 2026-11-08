module Main (main) where

import Control.Exception
import System.Environment
import System.IO

main :: IO ()
main =
    getArgs
        >>= ( \args ->
                case args of
                    [] -> printHelp
                    [fn] -> printFile fn
                    _ -> printHelp
            )

printFile :: String -> IO ()
printFile fn = catch (readFile' fn) (\e -> hPutStr stderr ("ERROR: " ++ show (e :: IOException)) >> pure "") >>= putStrLn

printHelp :: IO ()
printHelp = putStrLn "Usage: haskell-cat [FILE]"

{-# LANGUAGE OverloadedStrings #-}

module Lib where
import Network.Socket
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types.Status

runServer:: IO()
runServer = do
    let p = 3000
    putStrLn $ "Warp is starting on http://localhost:" ++ show p ++ "/ ..."
    withSocketsDo $ run p (\ req resp -> 
        resp $ responseBuilder 
            status200 [("Content-Type", "text/plain; charset=utf-8")] "Hello" )
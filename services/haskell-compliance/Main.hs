{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types
import qualified Data.ByteString.Lazy.Char8 as L8

app :: Application
app _ respond = respond $ responseLBS status200 [("Content-Type","text/plain")] "Haskell Compliance Service"

main :: IO ()
main = do
  let port = 3012
  putStrLn $ "Haskell Compliance Service running on port " ++ show port
  run port app

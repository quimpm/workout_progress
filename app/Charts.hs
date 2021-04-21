module Charts (printChart) where

import Types
import Graphics.EasyPlot
import Data.Time.Clock.POSIX
import Data.Time.Format

printChart :: String -> [BodyPart] -> IO Bool
printChart bodyPart querySet = do
       plot X11 $ Data2D [Style Lines, Title bodyPart] [] $ map (\x -> (dateRegistry x, part x)) querySet


module Charts (printChart) where

import Types
import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo
import Data.Time.LocalTime



printChart :: String -> [BodyPart] -> IO()
printChart bodyPart querySet = toFile def "Result.png" $ do
        layout_title .= bodyPart
        plot (line "cm" $ [map (\x -> (part x, dateRegistry x)) querySet])


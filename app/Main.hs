module Main(main) where

import Types
import System.Environment
import Database

rFloat :: String -> Float 
rFloat = read

getMeasuresOfBodyParts :: IO Body 
getMeasuresOfBodyParts = do
    putStrLn "Put your current Left Biceps Perimeter:"
    leftBiceps <- getLine
    putStrLn "Put your current Right Biceps Perimeter:"
    rightBiceps <- getLine 
    putStrLn "Put your current Shouders Perimeter"
    shoulders <- getLine 
    putStrLn "Put your current Back Longitude"
    back <- getLine 
    putStrLn "Put your current Pectoral Perimeter"
    pectoral <- getLine
    putStrLn "Put your current Up Right Leg Perimeter"
    upRightLeg <- getLine
    putStrLn "Put your current Down Right Leg Perimeter"
    downRightLeg <- getLine
    putStrLn "Put your current Up Left Leg Perimeter"
    upLeftLeg <- getLine
    putStrLn "Put your current Down Left Leg Perimeter"
    downLeftLeg <- getLine
    putStrLn "Put your current Belly Perimeter (under navel)"
    belly <- getLine
    putStrLn "Put your current Butt Perimeter"
    butt <- getLine
    putStrLn "Put your current Weight"
    weight <- getLine
    putStrLn "Put your current Height"
    height <- getLine
    return Body {
        leftArm = rFloat leftBiceps 
        , rightArm = rFloat rightBiceps 
        , shoulders = rFloat shoulders
        , back = rFloat back
        , pectoral = rFloat pectoral
        , leftUpLeg = rFloat upLeftLeg
        , leftDownLeg = rFloat downLeftLeg
        , rightUpLeg = rFloat upRightLeg
        , rightDownLeg = rFloat downRightLeg
        , belly = rFloat belly
        , butt = rFloat butt
        , weight = rFloat weight
        , height = rFloat height
    }

add :: IO()
add = do
    body <- getMeasuresOfBodyParts
    insertToBBDD body

view :: IO()
view = do
    putStrLn "Select the chart you want to see by typing one of: <legs, arms, back, shoulders, pectoral, belly, weight, height>"
    chart <- getLine
    putStrLn chart


dispatch :: [(String, IO())]
dispatch = [
                ("add", add),
                ("view", view)
            ]

main :: IO()
main = do 
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action
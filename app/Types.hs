module Types (Body(..)) where

data Body = Body { leftArm :: Float 
                 , rightArm :: Float 
                 , shoulders :: Float
                 , back :: Float
                 , pectoral :: Float 
                 , leftUpLeg :: Float
                 , leftDownLeg :: Float
                 , rightUpLeg :: Float
                 , rightDownLeg :: Float
                 , belly :: Float
                 , butt :: Float
                 , weight :: Float
                 , height :: Float
                }deriving (Show, Eq, Ord, Read)


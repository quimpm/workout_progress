module Types (BodyRegistry(..)
             , BodyPart(..)) where

data BodyRegistry = BodyRegistry { leftArm :: Float 
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
                         , date :: Float
                         }deriving (Show, Eq, Ord, Read)


data BodyPart = BodyPart {
                            part :: Float
                            , dateRegistry :: Float
                         } deriving (Show, Eq, Ord, Read)
{-# LANGUAGE OverloadedStrings #-}
module Database( insertToBBDD
                ,selectToBBDD ) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Database.SQLite.Simple.ToRow
import Data.Text as T
import Types

instance FromRow BodyPart where
    fromRow = BodyPart <$> field <*> field

instance FromRow BodyRegistry  where
    fromRow = BodyRegistry <$> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field

instance ToRow BodyRegistry where
  toRow (BodyRegistry a b c d e f g h i j k l m n) = toRow [a, b, c, d ,e ,f ,g ,h ,i ,j ,k ,l, m, n]

replaceInQuery :: String -> (String, String) -> String
replaceInQuery s (x,y) = T.unpack $ T.replace (T.pack x) (T.pack y) (T.pack s)

insertToBBDD :: BodyRegistry -> IO()
insertToBBDD body = do 
    conn <- open "body.db"
    execute_ conn "CREATE TABLE IF NOT EXISTS body (leftArm REAL, rightArm REAL, shoulders REAL, back REAL, pectoral REAL, leftUpLeg REAL, leftDownLeg REAL, rightUpLeg REAL, rightDownLeg REAL, belly REAL, butt REAL, weight REAL, height REAL, date REAL)"
    execute conn "INSERT INTO body (leftArm, rightArm, shoulders, back, pectoral, leftUpLeg, leftDownLeg, rightUpLeg, rightDownLeg, belly, butt, weight, height, date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)" body
    close conn
    putStrLn "Saved Data!"

dispatchQuery :: [(String, Query)]
dispatchQuery = [
                ("leftArm", "SELECT leftArm, date from body"),
                ("rightArm", "SELECT rightArm, date from body"),
                ("shoulders", "SELECT shoulders, date from body"),
                ("back", "SELECT back, date from body"),
                ("pectoral", "SELECT pectoral, date from body"),
                ("leftUpLeg", "SELECT leftUpLeg, date from body"),
                ("leftDownLeg", "SELECT leftDownLeg, date from body"),
                ("rightUpLeg", "SELECT rightUpLeg, date from body"),
                ("rightDownLeg", "SELECT rightDownLeg, date from body"),
                ("belly", "SELECT belly, date from body"),
                ("butt", "SELECT butt, date from body"),
                ("weight", "SELECT weight, date from body"),
                ("height", "SELECT height, date from body")
            ]

selectToBBDD :: String -> IO [BodyPart]
selectToBBDD column = do    
    conn <- open "body.db"
    let (Just query) = lookup column dispatchQuery
    query_ conn query :: IO [BodyPart]
    
    
    

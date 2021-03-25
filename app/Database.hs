module Database( insertToBBDD, execute ) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Types
import Data.Time.Clock
import Data.Time.Calendar

date :: IO (Integer,Int,Int) -- :: (year,month,day)
date = getCurrentTime >>= return . toGregorian . utctDay

instance FromRow Body where
    fromRow = Body <$> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field
        
insertToBBDD :: Body -> IO()
insertToBBDD body = do 
    putStrLn "ep"
    {--conn <- open "../database/body.db"
    execute_ conn "CREATE TABLE IF NOT EXISTS body (leftArm REAL, rightArm REAL, shoulders REAL, back REAL, pectoral REAL, leftUpLeg REAL, leftDownLeg REAL, rightUpLeg REAL, rightDownLeg REAL, belly REAL, butt REAL, weight REAL, height REAL)"
    execute conn "INSERT INTO body (leftArm, rightArm, shoulders, back, pectoral, leftUpLeg, leftDownLeg, rightUpLeg, rightDownLeg, belly, butt, weight, height) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)" body
    close conn--}
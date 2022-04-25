{-# LANGUAGE BlockArguments        #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE TypeFamilies          #-}

module Database.DbCore where

import           Data.Text        (Text)
import           GHC.Generics     (Generic)
import           Hasql.Connection as Connection (Connection, Settings, acquire,
                                                 settings)
import           Hasql.Session    (QueryError, run, statement)
import           Hasql.Statement  (Statement)
import           Prelude

devConfig :: Connection.Settings
devConfig =
  Connection.settings
    "localhost"
    5432
    "admin"
    "A6@Gvbwi$hMNsv"
    "ivy_local"

connectToDb :: IO Connection
connectToDb = do
  Right conn <- acquire devConfig
  return conn

executeQuery :: Statement () a -> IO (Either QueryError a)
executeQuery stm = do
  conn <- connectToDb
  let preparedStm = statement () stm
  run preparedStm conn

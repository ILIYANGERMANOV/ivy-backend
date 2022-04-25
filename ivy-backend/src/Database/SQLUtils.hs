{-# LANGUAGE OverloadedStrings #-}

module Database.SQLUtils where

import           Data.Text (Text)

likeWildcardQuery :: Text -> Text
likeWildcardQuery q = "%" <> q <> "%"

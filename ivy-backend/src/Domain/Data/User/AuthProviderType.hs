{-# language DeriveGeneric #-}
{-# language DerivingVia #-}
{-# language DuplicateRecordFields #-}
{-# language TypeFamilies #-}
{-# language OverloadedStrings #-}

module Domain.Data.User.AuthProviderType where

import Servant.API.Generic ( Generic )
import Rel8 ( DBType, ReadShow(ReadShow), DBEq )
import Data.Aeson ( FromJSON, ToJSON (toJSON), object, KeyValue ((.=)) )
import Data.UUID (UUID)
import Data.Text as Text ( Text )


data AuthProviderType
  = Ivy
  | Google
  deriving (Generic)
  deriving stock (Read, Show, Eq)
  deriving DBType via ReadShow AuthProviderType

instance DBEq AuthProviderType

instance FromJSON AuthProviderType
instance ToJSON AuthProviderType
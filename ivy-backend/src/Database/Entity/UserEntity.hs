{-# LANGUAGE BlockArguments        #-}
{-# LANGUAGE DeriveAnyClass        #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE StandaloneDeriving    #-}
{-# LANGUAGE TypeFamilies          #-}

module Database.Entity.UserEntity where

import           Data.Bool                         (Bool)
import           Data.Functor.Contravariant        ((>$<))
import           Data.Int                          (Int32, Int64)
import           Data.Password.Bcrypt              (Bcrypt,
                                                    PasswordHash (unPasswordHash))
import           Data.Text                         (Text)
import           Data.UUID                         (UUID)
import           Database.SQLUtils                 (likeWildcardQuery)
import           Domain.Data.User.AuthProviderType (AuthProviderType)
import           GHC.Generics                      (Generic)
import           Hasql.Statement                   (Statement)
import           Prelude                           hiding (id)
import           Rel8                              (Column,
                                                    Delete (Delete, deleteWhere, from, returning, using),
                                                    Expr,
                                                    Insert (Insert, into, onConflict, returning, rows),
                                                    Name, OnConflict (Abort),
                                                    Query, Rel8able, Result,
                                                    TableSchema (..),
                                                    Update (Update, from, returning, set, target, updateWhere),
                                                    asc, delete, each, ilike,
                                                    insert, limit, lit, offset,
                                                    orderBy, select, update,
                                                    values, where_, (&&.),
                                                    (/=.), (==.))

data UserEntity f =
  UserEntity
    { _id                :: Column f UUID
    , _email             :: Column f Text
    , _passwordHash      :: Column f Text
    , _authProvider      :: Column f AuthProviderType
    , _firstName         :: Column f Text
    , _lastName          :: Column f (Maybe Text)
    , _profilePictureUrl :: Column f (Maybe Text)
    , _color             :: Column f (Maybe Int64)
    , _endColor          :: Column f (Maybe Int64)
    , _testUser          :: Column f Bool
    }
  deriving (Generic)
  deriving anyclass (Rel8able)

userSchema :: TableSchema (UserEntity Name)
userSchema =
  TableSchema
    { name = "users"
    , schema = Nothing
    , columns =
        UserEntity
          { _id = "id"
          , _email = "email"
          , _passwordHash = "password_hash"
          , _authProvider = "auth_provider_type"
          , _firstName = "first_name"
          , _lastName = "last_name"
          , _profilePictureUrl = "profile_picture_url"
          , _color = "color"
          , _endColor = "end_color"
          , _testUser = "test_user"
          }
    }

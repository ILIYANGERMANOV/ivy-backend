module Util.StringUtils where
import Data.Text

-- add useful ByteString <> Text <> String tranformations utils here

notBlank :: Text -> Bool
notBlank = Data.Text.any (/= ' ')

blank :: Text -> Bool
blank = not . notBlank

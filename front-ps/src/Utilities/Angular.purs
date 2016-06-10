module Utilities.Angular where

import Control.Monad.Eff (Eff)
import Prelude (Unit)

foreign import data Provider :: *
foreign import data Directive :: *
foreign import data Decorator :: *
foreign import data Injectee :: *

foreign import data NgClass :: *
foreign import data DecoratedNgClass :: *

foreign import data ANGULAR :: !
type EffNg a = Eff (angular :: ANGULAR) a

foreign import data MemberFunction :: *

foreign import toMemberFunction :: forall a. a -> MemberFunction
foreign import toDirective :: forall a. a -> Directive

type NgClassProto a b = {
  name :: String,
  classScope :: a,
  memberFunctions :: b
}

foreign import data NgService :: *
foreign import toNgService :: NgClass -> NgService

foreign import toEffNgUnit :: forall a. a -> EffNg Unit

-- foreign import toInjectee :: forall a. a -> Injectee
foreign import toNgClass :: forall a b. (NgClassProto a b) -> NgClass

foreign import scopeUpdater :: forall a. a -> a -> EffNg a

foreign import scopeUpdaterNew :: forall a. a -> (a -> a) -> a

foreign import scopeExtractor :: forall a b. a -> (a -> b) -> b

foreign import decorateNgClass :: NgClass -> Array Decorator -> Array Injectee -> DecoratedNgClass

foreign import log :: forall a b. a -> b

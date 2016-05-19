module Utilities.Angular where

import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn3, runFn3)

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

-- foreign import toInjectee :: forall a. a -> Injectee
foreign import toNgClass :: forall a b. (NgClassProto a b) -> NgClass

foreign import scopeUpdater :: forall a. a -> a -> EffNg a

foreign import decorateNgClassUncurried :: Fn3 NgClass (Array Decorator) (Array Injectee) DecoratedNgClass

decorateNgClass :: NgClass -> Array Decorator -> Array Injectee -> DecoratedNgClass
decorateNgClass = runFn3 decorateNgClassUncurried

foreign import log :: forall a b. a -> b

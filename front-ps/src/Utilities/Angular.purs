module Utilities.Angular where

import Data.Function.Uncurried (Fn3, runFn3)

foreign import data Provider :: *
foreign import data Directive :: *
foreign import data Decorator :: *
foreign import data Injectee :: *

foreign import data NgClass :: *
foreign import data DecoratedNgClass :: *

foreign import data ANGULAR :: !

foreign import data MemberFunction :: *

foreign import toMemberFunction :: forall a. a -> MemberFunction
foreign import toDirective :: forall a. a -> Directive

-- foreign import toInjectee :: forall a. a -> Injectee
foreign import toNgClassUncurried :: forall a. Fn3 String a (Array MemberFunction) NgClass

toNgClass :: forall a. String -> a -> Array MemberFunction -> NgClass
toNgClass = runFn3 toNgClassUncurried

foreign import decorateNgClassUncurried :: Fn3 NgClass (Array Decorator) (Array Injectee) DecoratedNgClass

decorateNgClass :: NgClass -> Array Decorator -> Array Injectee -> DecoratedNgClass
decorateNgClass = runFn3 decorateNgClassUncurried

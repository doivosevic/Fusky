module Utilities.Angular where

import Data.Function.Uncurried (Fn2, runFn2)

foreign import data Provider :: *
foreign import data Directive :: *
foreign import data Decorator :: *

foreign import data NgClass :: *
foreign import data DecoratedNgClass :: *

foreign import toNgClass :: forall a. a -> NgClass

foreign import decorateNgClassUncurried :: Fn2 NgClass (Array Decorator) DecoratedNgClass

decorateNgClass :: NgClass -> Array Decorator -> DecoratedNgClass
decorateNgClass = runFn2 decorateNgClassUncurried

module Angular.Browser where

import Utilities.Angular (Provider, DecoratedNgClass, EffNg)
import Data.Function.Uncurried (Fn2, runFn2)
import Prelude (Unit)

foreign import bootstrapUncurried :: Fn2 DecoratedNgClass (Array Provider) (EffNg Unit)

bootstrap :: DecoratedNgClass -> Array Provider -> EffNg Unit
bootstrap = runFn2 bootstrapUncurried

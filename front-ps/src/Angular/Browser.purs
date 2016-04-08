module Angular.Browser where

import Utilities.Angular (Provider, DecoratedNgClass)
import Data.Function.Uncurried (Fn2, runFn2)
import Prelude (Unit)

foreign import bootstrapUncurried :: Fn2 DecoratedNgClass (Array Provider) Unit

bootstrap :: DecoratedNgClass -> Array Provider -> Unit
bootstrap = runFn2 bootstrapUncurried

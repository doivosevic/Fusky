module Angular.Browser where

import Control.Monad.Eff (Eff)
import Utilities.Angular (Provider, DecoratedNgClass, ANGULAR)
import Data.Function.Uncurried (Fn2, runFn2)
import Prelude (Unit)

foreign import bootstrapUncurried :: forall e. Fn2 DecoratedNgClass (Array Provider) (Eff (angular :: ANGULAR | e) Unit)

bootstrap :: forall e. DecoratedNgClass -> Array Provider -> Eff (angular :: ANGULAR | e) Unit
bootstrap = runFn2 bootstrapUncurried

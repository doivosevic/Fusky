module Angular.Browser where

import Utilities.Angular (Provider, DecoratedNgClass, EffNg)
import Prelude (Unit)

foreign import bootstrap :: DecoratedNgClass -> Array Provider -> EffNg Unit

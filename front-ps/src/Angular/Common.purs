module Angular.Common where

import Utilities.Angular

foreign import formProviders :: Provider
foreign import commonDirectives :: Directive

foreign import data Control :: *
foreign import data ControlGroup :: *

foreign import newControl :: String -> Control
foreign import newControlGroup :: forall a. a -> ControlGroup

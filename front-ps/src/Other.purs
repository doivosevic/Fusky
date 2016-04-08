module Other where

import Data.Function.Uncurried (Fn1, Fn2, runFn2)

data NgClass

x :: String
x = "XXXX"

foreign import __decorate :: Fn2 (Array Decorator) NgClass NgClass
foreign import data Directive :: *


decorate :: Array Decorator -> NgClass -> NgClass
decorate = runFn2 __decorate

foreign import data Decorator :: *
foreign import createRouteConfig :: Fn1 (Array Route) Decorator
foreign import createComponent :: Fn1 Component Decorator

data Component = Component {
  selector :: String,
  templateUrl :: String,
  --styles :: Array xyz,
  directives :: Array Directive
}

-- data RouteConfig = RouteConfig (Array Route)

data Route = Route {
  path :: String,
  name :: String,
  component :: NgClass,
  useAsDefault :: Boolean
}

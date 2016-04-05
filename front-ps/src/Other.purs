module Other(x) where

import Data.Function.Uncurried (Fn2, runFn2)

x :: String
x = "XXXX"

foreign import __decorateUncurried :: forall a. Fn2 (Array (Decorate a)) Master -> Master
foreign import data Directive :: *


__decorate :: forall a. Array (Decorate a) -> Master -> Master
__decorate = runFn2 __decorateUncurried

data Decorate = DComponent Component | DRouteConfig RouteConfig

data Component = Component {
  selector :: String,
  templateUrl :: String,
  --styles :: Array xyz,
  directives :: Array Directive
}

data RouteConfig = RouteConfig (Array Route)

data Route = Route {
  path :: String,
  name :: String,
  component :: Master,
  useAsDefault :: Boolean
}

data Master

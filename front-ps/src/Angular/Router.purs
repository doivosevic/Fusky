module Angular.Router where

import Utilities.Angular (Provider, Directive, Decorator, DecoratedNgClass)
import Data.Function.Uncurried (Fn1, runFn1)

foreign import routerProviders :: Provider
foreign import routerDirectives :: Directive

type Path = String

type Route = {
  path :: Path,
  name :: String,
  component :: DecoratedNgClass,
  useAsDefault :: Boolean
}

foreign import createRouteConfigUncurried :: Fn1 (Array Route) Decorator

createRouteConfig :: Array Route -> Decorator
createRouteConfig = runFn1 createRouteConfigUncurried

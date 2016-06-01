module Angular.Router where

import Utilities.Angular (Provider, Directive, Decorator, DecoratedNgClass)

foreign import routerProviders :: Provider
foreign import routerDirectives :: Directive

type Path = String

type Route = {
  path :: Path,
  name :: String,
  component :: DecoratedNgClass,
  useAsDefault :: Boolean
}

foreign import createRouteConfig :: Array Route -> Decorator

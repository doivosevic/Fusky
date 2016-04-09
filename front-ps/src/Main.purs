module Main where

import Prelude (Unit)
import Control.Monad.Eff (Eff)

import Angular.Common (formProviders)
import Angular.Browser (bootstrap)
import Angular.Http (httpProviders)
import Angular.Router (routerProviders)

import Utilities.Angular (ANGULAR)
import App.Root (decoratedNgApp)

main :: forall a e. a -> Eff (angular :: ANGULAR | e ) Unit
main = \_ -> bootstrap decoratedNgApp [
  formProviders,
  httpProviders,
  routerProviders
]

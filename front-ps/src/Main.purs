module Main where

import Prelude (Unit)

import Angular.Common (formProviders)
import Angular.Browser (bootstrap)
import Angular.Http (httpProviders)
import Angular.Router (routerProviders)

import Utilities.Angular (EffNg)
import App.Root (decoratedNgApp)

main :: forall a. a -> EffNg Unit
main = \_ -> bootstrap decoratedNgApp [
  formProviders,
  httpProviders,
  routerProviders
]

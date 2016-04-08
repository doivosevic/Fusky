module Index where

import Prelude (Unit)

import Angular.Common (formProviders)
import Angular.Browser (bootstrap)
import Angular.Http (httpProviders)
import Angular.Router (routerProviders)

import App (decoratedNgApp)

x :: Unit
x = bootstrap decoratedNgApp [
  formProviders,
  httpProviders,
  routerProviders
]

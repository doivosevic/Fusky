module App where

import Utilities.Angular (NgClass, toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (Component, createComponent)
import Angular.Router (Route, createRouteConfig, routerDirectives)
import Angular.Common (commonDirectives)

app :: { x :: String, y :: String }
app = {
  x: "Ovo je x",
  y: "Ovo je y"
}

appComponent :: Component
appComponent = {
  selector: "App",
  templateUrl: "./dest/app.html",
  styles: [],
  directives: [routerDirectives, commonDirectives]
}

appRoutes :: Array Route
appRoutes = [
  -- { path: "/", name: "Index", component: Index, useAsDefault: true },
  -- { path: "/overview", name: "Overview", component: Overview, useAsDefault: false }
]

ngApp :: NgClass
ngApp = toNgClass app

decoratedNgApp :: DecoratedNgClass
decoratedNgApp = decorateNgClass ngApp [
  createComponent appComponent,
  createRouteConfig appRoutes
]

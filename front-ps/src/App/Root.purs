module App.Root where

import Utilities.Angular (NgClass, toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (Component, createComponent)
import Angular.Router (Route, createRouteConfig, routerDirectives)
import Angular.Common (commonDirectives)

import App.Views.Overview (overview)
import App.Views.Index (index)

app :: { x :: String, y :: String, bol :: Boolean }
app = {
  x: "Ovo je x",
  y: "Ovo je y",
  bol: true
}

appComponent :: Component
appComponent = {
  selector: "App",
  templateUrl: "./dest/app.html",
  styles: [],
  directives: [ routerDirectives, commonDirectives ]
}

appRoutes :: Array Route
appRoutes = [
  { path: "/", name: "Index", component: index, useAsDefault: true },
  { path: "/overview", name: "Overview", component: overview, useAsDefault: false }
]

ngApp :: NgClass
ngApp = toNgClass "App" app []

decoratedNgApp :: DecoratedNgClass
decoratedNgApp = decorateNgClass ngApp [
  createComponent appComponent,
  createRouteConfig appRoutes
] []

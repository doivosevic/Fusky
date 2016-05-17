module App.Root where

import Angular.Common (commonDirectives)
import Angular.Core (Component, createComponent)
import Angular.Router (Route, createRouteConfig, routerDirectives)
import App.Components.HeaderBar (headerBar)
import App.Views.Index (index)
import App.Views.Overview (overview)
import Utilities.Angular (toDirective, NgClass, toNgClass, DecoratedNgClass, decorateNgClass)

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
  directives: [ routerDirectives, commonDirectives, toDirective headerBar ]
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

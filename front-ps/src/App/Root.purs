module App.Root where

import Angular.Common (commonDirectives)
import Angular.Core (Component, createComponent)
import Angular.Router (Route, createRouteConfig, routerDirectives)
import App.Components.HeaderBar (headerBar)
import App.Views.Index (index)
import App.Views.Overview (overview)
import Utilities.Angular (Directive, toNgClass, MemberFunction, NgClassProto, toDirective, NgClass, DecoratedNgClass, decorateNgClass)

type RootScope = { x :: String, y :: String, bol :: Boolean }

rootScope :: RootScope
rootScope = {
  x: "Ovo je x",
  y: "Ovo je y",
  bol: true
}

rootDirectives :: Array Directive
rootDirectives = [ routerDirectives, commonDirectives, toDirective headerBar ]

rootComponent :: Component
rootComponent = {
  selector: "App",
  templateUrl: "./dest/app.html",
  styles: [],
  directives: rootDirectives
}

rootRoutes :: Array Route
rootRoutes = [
  { path: "/", name: "Index", component: index, useAsDefault: true },
  { path: "/overview", name: "Overview", component: overview, useAsDefault: false }
]

rootProto :: NgClassProto RootScope RootMemberFunctions
rootProto = {
  name: "App",
  classScope: rootScope,
  memberFunctions: rootMemberFunctions
}

type RootMemberFunctions = { }

rootMemberFunctions :: RootMemberFunctions
rootMemberFunctions = { }

root :: DecoratedNgClass
root = decorateNgClass (toNgClass rootProto) [
  createComponent rootComponent,
  createRouteConfig rootRoutes
] []

module App.Components.HeaderBar where

import Angular.Common (commonDirectives, formDirectives, ControlGroup, newControlGroup, newControl)
import Angular.Core (Component, createComponent)
import Angular.Http (httpGet)
import Angular.Router (routerDirectives)
import App.Services.AuthService (authService)
import Prelude (Unit, map)
import Utilities.Angular (Decorator, Directive, NgClassProto, NgClass, DecoratedNgClass, scopeUpdater, toMemberFunction, toNgClass, decorateNgClass, EffNg)

type HeaderBarScope = { userName :: String, userRole :: String, loginForm :: ControlGroup, authService :: NgClass }

headerBarScope :: HeaderBarScope
headerBarScope = {
  userName: "",
  userRole: "",
  loginForm: newControlGroup {
    email: newControl "",
    password: newControl ""
  },
  authService: authService
}

headerBarDirectives :: Array Directive
headerBarDirectives = [ commonDirectives, formDirectives, routerDirectives ]

headerBarComponent :: Decorator
headerBarComponent = createComponent {
  selector: "header-bar",
  templateUrl: "dest/components/headerBar/headerBar.html",
  styles: [],
  directives: headerBarDirectives
}

headerBarProto :: NgClassProto HeaderBarScope HeaderBarMemberFunctions
headerBarProto = {
  name: "headerBar",
  classScope: headerBarScope,
  memberFunctions: headerBarMemberFunctions
}

type HeaderBarMemberFunctions = { }

headerBarMemberFunctions :: HeaderBarMemberFunctions
headerBarMemberFunctions = { }

headerBar :: DecoratedNgClass
headerBar = decorateNgClass (toNgClass headerBarProto) [
  headerBarComponent
] []

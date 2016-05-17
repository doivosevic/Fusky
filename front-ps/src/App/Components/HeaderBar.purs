module App.Components.HeaderBar where

import Angular.Common (commonDirectives, formDirectives, ControlGroup, newControlGroup, newControl)
import Angular.Core (createComponent)
import Angular.Http (httpGet)
import Angular.Router (routerDirectives)
import Prelude (Unit, map)
import Utilities.Angular (DecoratedNgClass, NgClass, scopeUpdater, toMemberFunction, toNgClass, decorateNgClass, EffNg)

type HeaderBar = { userName :: String, userRole :: String, loginForm :: ControlGroup }

headerBarScope :: HeaderBar
headerBarScope = {
  userName: "",
  userRole: "",
  loginForm: newControlGroup {
    email: newControl "",
    password: newControl ""
  }
}

headerBar :: DecoratedNgClass
headerBar = decorateNgClass (toNgClass "headerBar" headerBarScope (map toMemberFunction [

  ])) [
    createComponent {
      selector: "header-bar",
      templateUrl: "dest/components/headerBar/headerBar.html",
      styles: [],
      directives: [ commonDirectives, formDirectives, routerDirectives ]
    }
  ] []

module App.Components.HeaderBar where

import Angular.Angular
import App.Services.AuthService (authService)

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

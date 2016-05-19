module App.Services.AuthService where

import Angular.Common (commonDirectives, formDirectives, ControlGroup, newControlGroup, newControl)
import Angular.Core (createComponent)
import Angular.Http (httpGet)
import Angular.Router (routerDirectives)
import Prelude (Unit, map)
import Utilities.Angular (NgClassProto, NgClass, DecoratedNgClass, scopeUpdater, toMemberFunction, toNgClass, decorateNgClass, EffNg)

type AuthServiceScope = { isLoggedIn :: Boolean, userRole :: String, userName :: String, authLevel :: String, accountType :: Number }

unlogged :: String
unlogged = "-1"
user :: String
user = "1"
editor :: String
editor = "2"
admin :: String
admin = "3"
owner :: String
owner = "4"

authServiceScope :: AuthServiceScope
authServiceScope = {
  isLoggedIn: false,
  userRole: "",
  userName: "",
  authLevel: unlogged,
  accountType: 0.0
}

type AuthServiceMemberFunctions = { }

authServiceMemberFunctions :: AuthServiceMemberFunctions
authServiceMemberFunctions  = { }

authServiceProto :: NgClassProto AuthServiceScope AuthServiceMemberFunctions
authServiceProto = {
  name: "authService",
  classScope: authServiceScope,
  memberFunctions: authServiceMemberFunctions
}

authService :: NgClass
authService = toNgClass authServiceProto

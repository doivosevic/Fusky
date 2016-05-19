module App.Views.Index where

import Prelude
import Angular.Common (ControlGroup, newControlGroup, newControl)
import Angular.Core (Component, createComponent)
import Angular.Http (httpPost)
import App.Components.Player (player)
import App.Components.Popular (popular)
import App.Components.RadioDescr (radioDescr)
import App.Components.Schedule (schedule)
import App.Components.Station (station)
import Utilities.Angular (Decorator, NgClassProto, log, EffNg, toNgClass, DecoratedNgClass, decorateNgClass, toDirective, Directive)

onSubmitRegistration :: IndexScope -> String -> EffNg IndexScope
onSubmitRegistration index' values = do
  httpPost "user/auth/register" values log
  pure index'

type IndexScope = { registerForm :: ControlGroup }

indexScope :: IndexScope
indexScope = {
  registerForm: newControlGroup {
    first_name: newControl "",
    last_name: newControl "",
    email: newControl "",
    password: newControl "",
    password2: newControl "",
    year_of_birth: newControl "",
    occupation: newControl ""
  }
}

indexDirectives :: Array Directive
indexDirectives = map toDirective [ player, popular, radioDescr, schedule, station ]

indexComponent :: Decorator
indexComponent = createComponent {
  selector: "Index",
  templateUrl: "dest/views/index/index.html",
  styles: [],
  directives: indexDirectives
}

indexProto :: NgClassProto IndexScope IndexMemberFunctions
indexProto = {
  name: "Index",
  classScope: indexScope,
  memberFunctions: indexMemberFunctions
}

type IndexMemberFunctions = { }

indexMemberFunctions :: IndexMemberFunctions
indexMemberFunctions = { }

index :: DecoratedNgClass
index = decorateNgClass (toNgClass indexProto) [
  indexComponent
] []

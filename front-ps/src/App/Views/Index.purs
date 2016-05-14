module App.Views.Index where

import Angular.Common (ControlGroup, newControlGroup, newControl)
import Angular.Core (createComponent)
import Angular.Http (httpPost)
import App.Components.Player (player)
import App.Components.Popular (popular)
import App.Components.RadioDescr (radioDescr)
import App.Components.Schedule (schedule)
import App.Components.Station (station)
import Prelude
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass, toDirective, Directive, EffNg, log)

myDirectives :: Array Directive
myDirectives = map toDirective [ player, popular, radioDescr, schedule, station ]

onSubmitRegistration :: Index -> String -> EffNg Index
onSubmitRegistration index' values = do
  httpPost "user/auth/register" values log
  pure index'

type Index = {
  registerForm :: ControlGroup
}

index :: DecoratedNgClass
index = decorateNgClass (toNgClass "Index" {
    registerForm: newControlGroup {
      first_name: newControl "",
      last_name: newControl "",
      email: newControl "",
      password: newControl "",
      password2: newControl "",
      year_of_birth: newControl "",
      occupation: newControl ""
    }
  } [

  ]) [
    createComponent {
      selector: "Index",
      templateUrl: "dest/views/index/index.html",
      styles: [],
      directives: myDirectives
    }
  ] []

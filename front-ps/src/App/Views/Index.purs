module App.Views.Index where

import Prelude (map)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass, toDirective, Directive)
import Angular.Core (createComponent)
import Angular.Common (newControlGroup, newControl)

import App.Components.Player (player)
import App.Components.Popular (popular)
import App.Components.RadioDescr (radioDescr)
import App.Components.Schedule (schedule)
import App.Components.Station (station)

myDirectives :: Array Directive
myDirectives = map toDirective [ player, popular, radioDescr, schedule, station ]

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

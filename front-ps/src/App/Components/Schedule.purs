module App.Components.Schedule where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

schedule :: DecoratedNgClass
schedule = decorateNgClass (toNgClass "schedule" {
    items: [],
    getItems: []
  } [ ]) [
    createComponent {
      selector: "schedule",
      templateUrl: "dest/components/schedule/schedule.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

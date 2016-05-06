module App.Components.Schedule where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

schedule :: DecoratedNgClass
schedule = decorateNgClass (toNgClass "Schedule" {
    items: [],
    getItems: []
  } [ ]) [
    createComponent {
      selector: "Schedule",
      templateUrl: "dest/components/schedule/schedule.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

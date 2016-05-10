module App.Components.RadioDescr where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)



radioDescr :: DecoratedNgClass
radioDescr = decorateNgClass (toNgClass "radioDescr" {
    descr: ""
  } [ ]) [
    createComponent {
      selector: "radioDescr",
      templateUrl: "dest/components/radioDescr/radioDescr.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

module App.Components.Station where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

station :: DecoratedNgClass
station = decorateNgClass (toNgClass "Station" {
    name: "asd",
    oib: "qwe",
    address: "dsg",
    email: "wqe",
    frequency: 100
  } [ ]) [
    createComponent {
      selector: "Station",
      templateUrl: "dest/components/station/station.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

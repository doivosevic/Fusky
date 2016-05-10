module App.Components.Popular where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

popular :: DecoratedNgClass
popular = decorateNgClass (toNgClass "popular" {
    tracks: []
  } [ ]) [
    createComponent {
      selector: "popular",
      templateUrl: "dest/components/popular/popular.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

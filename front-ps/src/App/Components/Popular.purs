module App.Components.Popular where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

popular :: DecoratedNgClass
popular = decorateNgClass (toNgClass "Popular" {
    tracks: []
  } [ ]) [
    createComponent {
      selector: "Popular",
      templateUrl: "dest/components/popular/popular.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

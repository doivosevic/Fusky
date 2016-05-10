module App.Components.Player where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

-- player :: { playing :: Boolean, timeout :: Number, progress :: Number, audio :: {
--   currentTime :: Number, duration :: Number
--   }, sourceUrl :: String }
-- player =

player :: DecoratedNgClass
player = decorateNgClass (toNgClass "player" {
    playing: false,
    timeout: 1000,
    progress: 0,
    audio: { currentTime: 0, duration: 100 },
    sourceUrl: "/player/get"
  } [ ]) [
    createComponent {
      selector: "player",
      templateUrl: "dest/components/player/player.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

module App.Components.Player where

import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

player :: DecoratedNgClass
player = decorateNgClass (toNgClass "Player" {
    playing: false,
    timeout: 1000,
    progress: 0,
    audio: { currentTime: 0, duration: 100 },
    sourceUrl: "/player/get"
  } [ ]) [
    createComponent {
      selector: "Player",
      templateUrl: "dest/components/player/player.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

module App.Components.Player where

import Prelude (negate)
import Angular.Common (commonDirectives)
import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

-- player :: { playing :: Boolean, timeout :: Number, progress :: Number, audio :: {
--   currentTime :: Number, duration :: Number
--   }, sourceUrl :: String }
-- player =

type Audio = { currentTime :: Int, duration :: Int }
type Track = { id :: Int, title :: String, artist :: String,
  album :: String, genre :: String, year :: Int,
  play_duration :: Int, play_location :: Int, editor :: String }

foreign import getAudioFromDom :: String -> Audio

defaultTrack :: Track
defaultTrack = { id: (-1), title: "Nepostojeci zapis", artist: "n/a",
  album: "n/a", genre: "n/a", year: 0, play_duration: 0,
  play_location: 0, editor: "n/a" }

player :: DecoratedNgClass
player = decorateNgClass (toNgClass "player" {
    playing: false,
    timeout: 1000,
    progress: 0,
    audio: { currentTime: 0, duration: 100 },
    sourceUrl: "/player/get",
    track: defaultTrack
  } [ ]) [
    createComponent {
      selector: "player",
      templateUrl: "dest/components/player/player.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

module App.Components.Player where

import Angular.Common (commonDirectives)
import Angular.Core (createComponent, Component)
import Prelude (negate)
import Utilities.Angular (Decorator, toNgClass, DecoratedNgClass, decorateNgClass, Directive, NgClassProto)

type Audio = { currentTime :: Number, duration :: Number }
type Track = { id :: Int, title :: String, artist :: String,
  album :: String, genre :: String, year :: Int,
  play_duration :: Int, play_location :: Int, editor :: String }

foreign import getAudioFromDom :: String -> Audio

defaultTrack :: Track
defaultTrack = { id: (-1), title: "Nepostojeci zapis", artist: "n/a",
  album: "n/a", genre: "n/a", year: 0, play_duration: 0,
  play_location: 0, editor: "n/a" }

type PlayerScope = { playing :: Boolean, timeout :: Number, progress :: Number, audio :: Audio, sourceUrl :: String, track :: Track }

playerScope :: PlayerScope
playerScope = {
    playing: false,
    timeout: 1000.0,
    progress: 0.0,
    audio: { currentTime: 0.0, duration: 100.0 },
    sourceUrl: "/player/get",
    track: defaultTrack
}

playerDirectives :: Array Directive
playerDirectives = [ commonDirectives ]

playerComponent :: Decorator
playerComponent = createComponent {
  selector: "player",
  templateUrl: "dest/components/player/player.html",
  styles: [],
  directives: playerDirectives
}

playerProto :: NgClassProto PlayerScope PlayerMemberFunctions
playerProto = {
  name: "player",
  classScope: playerScope,
  memberFunctions: playerMemberFunctions
}

type PlayerMemberFunctions = { }

playerMemberFunctions :: PlayerMemberFunctions
playerMemberFunctions = { }

player :: DecoratedNgClass
player = decorateNgClass (toNgClass playerProto) [
  playerComponent
] []

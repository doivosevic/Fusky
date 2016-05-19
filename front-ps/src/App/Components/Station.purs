module App.Components.Station where

import Angular.Common (commonDirectives)
import Angular.Core (Component, createComponent)
import Angular.Http (httpGet)
import Prelude (Unit, negate)
import Utilities.Angular (Decorator, scopeUpdater, EffNg, toNgClass, DecoratedNgClass, decorateNgClass, NgClassProto, Directive)

type StationScope = { name :: String, oib :: String, address :: String, email :: String, frequency :: Number }

stationScope :: StationScope
stationScope = {
  name: "asd",
  oib: "qwe",
  address: "dsg",
  email: "wqe",
  frequency: 100.0
}

psConstructor :: StationScope -> EffNg Unit
psConstructor station' = httpGet "/station/get" (scopeUpdater stationScope)

stationDirectives :: Array Directive
stationDirectives = [ commonDirectives ]

stationComponent :: Decorator
stationComponent = createComponent {
  selector: "station",
  templateUrl: "dest/components/station/station.html",
  styles: [],
  directives: stationDirectives
}

stationProto :: NgClassProto StationScope StationMemberFunctions
stationProto = {
  name: "station",
  classScope: stationScope,
  memberFunctions: stationMemberFunctions
}

type StationMemberFunctions = { psConstructor :: StationScope -> EffNg Unit }

stationMemberFunctions :: StationMemberFunctions
stationMemberFunctions = {
  psConstructor: psConstructor
}

station :: DecoratedNgClass
station = decorateNgClass (toNgClass stationProto) [
  stationComponent
] []

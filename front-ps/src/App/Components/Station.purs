module App.Components.Station where

import Angular.Common (commonDirectives)
import Angular.Core (createComponent)
import Angular.Http (httpGet)
import Prelude (Unit, map)
import Utilities.Angular (NgClass, scopeUpdater, toMemberFunction, toNgClass, DecoratedNgClass, decorateNgClass, EffNg)

type Station = { name :: String, oib :: String, address :: String, email :: String, frequency :: Number }

stationScope :: Station
stationScope = {
  name: "asd",
  oib: "qwe",
  address: "dsg",
  email: "wqe",
  frequency: 100.0
}

psConstructor :: Station -> EffNg Unit
psConstructor station' = httpGet "/station/get" (scopeUpdater stationScope)

stationClass :: NgClass
stationClass = toNgClass "station" stationScope (map toMemberFunction [ psConstructor ])

station :: DecoratedNgClass
station = decorateNgClass stationClass [
    createComponent {
      selector: "station",
      templateUrl: "dest/components/station/station.html",
      styles: [],
      directives: [ commonDirectives ]
    }
  ] [ ]

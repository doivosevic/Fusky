module App.Views.Overview where

import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

overview :: DecoratedNgClass
overview = decorateNgClass (toNgClass "Overview" {
    yahooo: 123,
    wowow: "hehe",
    tko: "Dito",
    items: [
      { name: "Ana", number: 213 },
      { name: "Dito", number: 222 }
    ]
  } [

  ]) [
    createComponent {
      selector: "Overview",
      templateUrl: "dest/views/overview/overview.html",
      styles: [],
      directives: [ ]
    }
  ] []

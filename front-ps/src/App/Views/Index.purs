module App.Views.Index where

import Utilities.Angular (toNgClass, DecoratedNgClass, decorateNgClass)
import Angular.Core (createComponent)

index :: DecoratedNgClass
index = decorateNgClass (toNgClass {
    someText: "Text text",
    moreText: "Heyooo",
    xyz: 123,
    items: [
      { name: "Bozo", number: 555 },
      { name: "Kifla", number: 111 }
    ]
  }) [
    createComponent {
      selector: "Index",
      templateUrl: "dest/views/index/index.html",
      styles: [],
      directives: []
    }
  ]

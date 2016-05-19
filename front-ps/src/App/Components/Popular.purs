module App.Components.Popular where

import Angular.Common (commonDirectives)
import Angular.Core (Component, createComponent)
import Utilities.Angular (Decorator, toNgClass, DecoratedNgClass, decorateNgClass, NgClassProto, Directive)

type PopularScope = { }

popularScope :: PopularScope
popularScope = { }

popularDirectives :: Array Directive
popularDirectives = [ commonDirectives ]

popularComponent :: Decorator
popularComponent = createComponent {
  selector: "popular",
  templateUrl: "dest/components/popular/popular.html",
  styles: [],
  directives: popularDirectives
}

popularProto :: NgClassProto PopularScope PopularMemberFunctions
popularProto = {
  name: "popular",
  classScope: popularScope,
  memberFunctions: popularMemberFunctions
}

type PopularMemberFunctions = { }

popularMemberFunctions :: PopularMemberFunctions
popularMemberFunctions = { }

popular :: DecoratedNgClass
popular = decorateNgClass (toNgClass popularProto) [
  popularComponent
] []

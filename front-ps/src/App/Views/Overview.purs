module App.Views.Overview where

import Angular.Core (Component, createComponent)
import Utilities.Angular (Decorator, Directive, toNgClass, DecoratedNgClass, decorateNgClass, NgClassProto)

type OverviewScope = { }

overviewScope :: OverviewScope
overviewScope = { }

overviewDirectives :: Array Directive
overviewDirectives = [ ]

overviewComponent :: Decorator
overviewComponent = createComponent {
  selector: "Overview",
  templateUrl: "dest/views/overview/overview.html",
  styles: [],
  directives: overviewDirectives
}

overviewProto :: NgClassProto OverviewScope OverviewMemberFunctions
overviewProto = {
  name: "Overview",
  classScope: overviewScope,
  memberFunctions: overviewMemberFunctions
}

type OverviewMemberFunctions = { }

overviewMemberFunctions :: OverviewMemberFunctions
overviewMemberFunctions = { }

overview :: DecoratedNgClass
overview = decorateNgClass (toNgClass overviewProto) [
  overviewComponent
] []

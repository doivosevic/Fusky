module App.Components.RadioDescr where

import Angular.Common (commonDirectives)
import Angular.Core (Component, createComponent)
import Utilities.Angular (Decorator, toNgClass, DecoratedNgClass, decorateNgClass, NgClassProto, Directive)

type RadioDescrScope = { }

radioDescrScope :: RadioDescrScope
radioDescrScope = { }

radioDescrDirectives :: Array Directive
radioDescrDirectives = [ commonDirectives ]

radioDescrComponent :: Decorator
radioDescrComponent = createComponent {
  selector: "radio-descr",
  templateUrl: "dest/components/radioDescr/radioDescr.html",
  styles: [],
  directives: radioDescrDirectives
}

radioDescrProto :: NgClassProto RadioDescrScope RadioDescrMemberFunctions
radioDescrProto = {
  name: "radioDescr",
  classScope: radioDescrScope,
  memberFunctions: radioDescrMemberFunctions
}

type RadioDescrMemberFunctions = { }

radioDescrMemberFunctions :: RadioDescrMemberFunctions
radioDescrMemberFunctions = { }

radioDescr :: DecoratedNgClass
radioDescr = decorateNgClass (toNgClass radioDescrProto) [
  radioDescrComponent
] []

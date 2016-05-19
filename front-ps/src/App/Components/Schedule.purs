module App.Components.Schedule where

import Angular.Common (commonDirectives)
import Angular.Core (Component, createComponent)
import Utilities.Angular (Decorator, toNgClass, DecoratedNgClass, decorateNgClass, NgClassProto, Directive)

type ScheduleScope = { }

scheduleScope :: ScheduleScope
scheduleScope = { }

scheduleDirectives :: Array Directive
scheduleDirectives = [ commonDirectives ]

scheduleComponent :: Decorator
scheduleComponent = createComponent {
  selector: "schedule",
  templateUrl: "dest/components/schedule/schedule.html",
  styles: [],
  directives: scheduleDirectives
}

scheduleProto :: NgClassProto ScheduleScope ScheduleMemberFunctions
scheduleProto = {
  name: "schedule",
  classScope: scheduleScope,
  memberFunctions: scheduleMemberFunctions
}

type ScheduleMemberFunctions = { }

scheduleMemberFunctions :: ScheduleMemberFunctions
scheduleMemberFunctions = { }

schedule :: DecoratedNgClass
schedule = decorateNgClass (toNgClass scheduleProto) [
  scheduleComponent
] []

module Angular.Core where

import Utilities.Angular (Directive, Decorator)
import Data.Function.Uncurried (Fn1, runFn1)

type Selector = String
type TemplateUrl = String
type Style = String

type Component = {
  selector :: Selector,
  templateUrl :: TemplateUrl,
  styles :: Array Style,
  directives :: Array Directive
}

foreign import createComponentUncurried :: Fn1 Component Decorator

createComponent :: Component -> Decorator
createComponent = runFn1 createComponentUncurried

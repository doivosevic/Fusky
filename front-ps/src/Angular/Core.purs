module Angular.Core where

import Utilities.Angular (Directive, Decorator)

type Selector = String
type TemplateUrl = String
type Style = String

type Component = {
  selector :: Selector,
  templateUrl :: TemplateUrl,
  styles :: Array Style,
  directives :: Array Directive
}

foreign import createComponent :: Component -> Decorator

module Typescript.Types where

import Data.Maybe (Maybe)

data TsClass a b = TsClass (Array (TsDecorator a)) (Maybe (TsConstructor a b)) (Array (TsClassMember b))

data TsClassMember a = TsClassMember a

data TsConstructor a b = TsConstructor (Array (TsClass a b))

data TsDecorator a = TsDecorator a

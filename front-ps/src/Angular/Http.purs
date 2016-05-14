module Angular.Http where

import Utilities.Angular (Provider, EffNg)
import Prelude (Unit)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3)

foreign import httpProviders :: Provider

foreign import httpGetUC :: forall a. Fn2 String a (EffNg Unit)
foreign import httpPostUC :: forall a b. Fn3 String a b (EffNg Unit)

httpGet :: forall a. String -> a -> (EffNg Unit)
httpGet = runFn2 httpGetUC

httpPost :: forall a b. String -> a -> b -> (EffNg Unit)
httpPost = runFn3 httpPostUC

module Angular.Http where

import Utilities.Angular (Provider, EffNg)
import Prelude (Unit)
import Rx.Observable

foreign import httpProviders :: Provider

foreign import httpGet :: forall a. String -> a -> (EffNg Unit)
foreign import httpPost :: forall a b. String -> a -> b -> (EffNg Unit)

foreign import httpGetOBS :: forall a. String -> Observable a
foreign import httpPostOBS :: forall a b. String -> a -> Observable b

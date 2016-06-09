module App.Services.AuthService where

import Angular.Angular
import Angular.Http (httpPostOBS)
import Control.Plus (empty)
import Rx.Observable (flatMap, Observable, subscribe)

type AuthServiceScope = { isLoggedIn :: Boolean, userRole :: String, userName :: String, authLevel :: String, accountType :: String }

unlogged :: String
unlogged = "-1"
user :: String
user = "1"
editor :: String
editor = "2"
admin :: String
admin = "3"
owner :: String
owner = "4"

authServiceScope :: AuthServiceScope
authServiceScope = {
  isLoggedIn: false,
  userRole: "",
  userName: "",
  authLevel: unlogged,
  accountType: "0"
}

type UpdateType = { account_type :: String, first_name :: String, last_name :: String }

updateUserAuth :: Observable AuthServiceScope
updateUserAuth = map update get
  where
    get :: Observable UpdateType
    get = httpGetOBS "/user/account/type"
    update = \resData -> scopeUpdaterNew authServiceScope (\oldScope -> 
      oldScope { authLevel = resData.account_type, isLoggedIn = true })

updateUserData :: EffNg Unit
updateUserData = subscribe updateUserAuth subsGetAcc
  where
    subsGetAcc :: AuthServiceScope -> EffNg Unit
    subsGetAcc = \_ -> subscribe getAcc update
    getAcc = httpGetOBS "/user/account/get"
    update :: UpdateType -> EffNg Unit
    update resData = toEffNgUnit (scopeUpdaterNew authServiceScope (\oldScope ->
      oldScope { userName = resData.first_name <> "  " <> resData.last_name
               , accountType = resData.account_type
               , userRole = if resData.account_type == user then "korisnik"
                  else if resData.account_type == editor then "urednik"
                  else if resData.account_type == admin then "administrator"
                  else if resData.account_type == owner then "vlasnik"
                  else "nepoznati"
                }))

logout :: forall a. a -> Observable AuthServiceScope
logout = \_ -> if scopeExtractor authServiceScope (\scope -> scope.isLoggedIn) 
                then flatMap logout_ (\_ -> updateUserAuth) 
                else empty
  where 
    logout_ = httpGetOBS "/user/auth/signout"
  
loginX :: String -> String -> EffNg Unit
loginX email password = subscribe login_ (\_ -> updateUserData)
  where
    postLogin = httpPostOBS "/user/auth/login" { email: email, password: password }
    login_ = flatMap (logout 0) (\_ -> postLogin)
    
loginAdmin :: forall a. a -> EffNg Unit
loginAdmin _ = loginX "dito@dito.ninja" "1dominik"
loginOwner :: forall a. a -> EffNg Unit
loginOwner _ = loginX "xdwarrior@gmail.com" "NeprobojnaLozinka"
loginEditor :: forall a. a -> EffNg Unit
loginEditor _ = loginX "dominik.ivosevic@gmail.com" "1dominik"
loginUser :: forall a. a -> EffNg Unit
loginUser _ = loginX "dominik.ivosevic@dito.ninja" "1dominik"

type AuthServiceMemberFunctions = { 
  updateUserAuth :: Observable AuthServiceScope,
  updateUserData :: EffNg Unit,
  logout :: forall a. a -> Observable AuthServiceScope,
  loginX :: String -> String -> EffNg Unit,
  loginAdmin :: forall a. a -> EffNg Unit,
  loginOwner :: forall a. a -> EffNg Unit,
  loginEditor :: forall a. a -> EffNg Unit,
  loginUser :: forall a. a -> EffNg Unit
}

authServiceMemberFunctions :: AuthServiceMemberFunctions
authServiceMemberFunctions  = { 
  updateUserAuth: updateUserAuth,
  updateUserData: updateUserData,
  logout: logout,
  loginX: loginX,
  loginAdmin: loginAdmin,
  loginOwner: loginOwner,
  loginEditor: loginEditor,
  loginUser: loginUser
}

authServiceProto :: NgClassProto AuthServiceScope AuthServiceMemberFunctions
authServiceProto = {
  name: "authService",
  classScope: authServiceScope,
  memberFunctions: authServiceMemberFunctions
}

authService :: NgClass
authService = toNgClass authServiceProto

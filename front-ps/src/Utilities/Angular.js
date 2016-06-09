// module Utilities.Angular

var __decorate = (this.__decorate) || function (decorators, target, key, desc) {
  var c = arguments.length;
  var r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc;
  var d;
  if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
  else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
  return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var __metadata = (this.__metadata) || function (k, v) {
  if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

exports.toEffNgUnit = function (a) { return a; }

exports.log = function (a) {
  console.log(a);
}

exports.scopeUpdater = function(scopeObj) {
  return function (newScope) {
    console.log("scopeUpdater");
    console.log(scopeObj);
    console.log(newScope);
    for (var elem in newScope) {

      scopeObj["realScope"][elem] = newScope[elem];
    }
    console.log(scopeObj);
    return scopeObj;
  }
}

exports.scopeUpdaterNew = function (scopeProto) {
  return function (scopeToScope) {
    var newScope = scopeToScope(scopeProto["realScope"]);
    for (var elem in newScope) {
      scopeProto["realScope"][elem] = newScope[elem];
    }
  }
}

exports.scopeExtractor = function (scopeProto) {
  return function (scopeToSomeThing) {
    return scopeToSomeThing(scopeProto["realScope"]);
  }
}

exports.toMemberFunction = function (a) {
  console.log("toMemberFunction");
  console.log(a);
  return a;
}

exports.toDirective = function (a) {
  return a;
}

exports.decorateNgClass = function (ngClass) {
  return function(decorators) {
    return function (constructorInjectors) {
      // console.log(ngClass);
      // var constructorInjectors = null;
      decorators.push(Reflect.metadata('design:paramtypes', constructorInjectors || []));
      var decoratedNgClass = Reflect.decorate(decorators, ngClass);

      console.log(ngClass.name);

      // console.log(ngClass);
      return decoratedNgClass;
    }
  }
};

exports.toNgClass = function (ngClassProtoObj) {
  console.log(ngClassProtoObj);
  var name = ngClassProtoObj.name;
  var classScope = ngClassProtoObj.classScope;
  var memberFunctions = ngClassProtoObj.memberFunctions;
  // ES6 version
  // var tempObj = {
  //   [name]() {
  //     for (var i in a) {
  //       this[i] = a[i];
  //     }
  //   }
  // }

  // var functAsString = "(fucntion )"

  // eval("var tempObj = {    [name]() {      for (var i in a) {        this[i] = a[i];      }    }  }");
  // console.log(tempObj[name].toString());
  // ES5 version
  // function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
  //
  // var tempObj = _defineProperty({}, name, function () {
  //   for (var i in a) {
  //     this[i] = a[i];
  //   }
  // });

  var functAsString = "" +
    "(function " + name + "() {" +
      // "var paramss = [a, b, c, d, e ,f];" +
      // "for (var i in paramss) {" +
      // "  this[i] = paramss[i];" +
      // "  console.log(this[i]);" +
      // "}" +
      "var self = this;" +
      // "throw 'asd'" +
      // "classScope[realScope] = self;" +
      "setTimeout(function () {console.log(self);}, 5000);" +
      "for (var i in classScope) {" +
      "  this[i] = classScope[i];" +
      // "  console.log(this[i]);" +
      "}" +
      "classScope['realScope'] = self;" +
      "console.log('cs'); console.log(classScope);" +
      "if (memberFunctions.psConstructor) memberFunctions.psConstructor(this);" +
      // "for (var i in this) {" +
      // "  if (this[i].name == 'psConstructor') {" +
      // "    var psConsRet = this[i](this);" +
      // // "    console.log(psConsRet);" +
      // // "    for (var elem in psConsRet) {" +
      // // "      this[elem] = psConsRet[elem];" +
      // // "    }" +
      // "  }" +
      // "}" +
    "})";

  var classFun = eval(functAsString);
  // classFun.__proto__ = Object.create(memberFunctions);
  console.log(classFun);
  console.log("name: " + name);
  classFun.__proto__ = classFun.__proto__ || {};
  for (var i in memberFunctions) {
    classFun.__proto__[i] = memberFunctions[i];
  }
  return classFun;
};

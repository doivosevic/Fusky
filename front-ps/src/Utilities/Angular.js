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

exports.toMemberFunction = function (a) {
  return a;
}

exports.toDirective = function (a) {
  return a;
}

exports.decorateNgClassUncurried = function (ngClass, decorators, constructorInjectors) {
  // console.log(ngClass);
  // var constructorInjectors = null;
  decorators.push(Reflect.metadata('design:paramtypes', constructorInjectors || []));
  var decoratedNgClass = Reflect.decorate(decorators, ngClass);

  console.log(ngClass.name);

  // console.log(ngClass);
  return decoratedNgClass;
};

exports.toNgClassUncurried = function (name, classScope, memberFunctions) {
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
      "for (var i in classScope) {" +
      "  this[i] = classScope[i];" +
      "  console.log(this[i]);" +
      "}" +
    "})";

  var classFun = eval(functAsString);

  for (var i in memberFunctions) {
    classFun.prototype[i] = memberFunctions[i];
  }
  return classFun;
};

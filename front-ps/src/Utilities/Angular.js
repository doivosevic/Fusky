// module Utilities.Angular

var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
  var c = arguments.length;
  var r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc;
  var d;
  if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
  else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
  return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var __metadata = (this && this.__metadata) || function (k, v) {
  if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


exports.decorateNgClassUncurried = function (ngClass, decorators/*, constructorInjectors*/) {
  // console.log(ngClass);
  var constructorInjectors = null;
  var ngClassFunc = function () {
    for (var i in ngClass) {
      this[i] = ngClass[i];
    }
  };
  decorators.push(__metadata('design:paramtypes', constructorInjectors || []));
  __decorate(decorators, ngClassFunc);
  return ngClassFunc;
};

exports.toNgClass = function (a) { return a; };

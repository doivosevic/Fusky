// module Angular.Core

var core = require("angular2/core");

exports.createComponent = function (a) {
  var ret = core.Component(a);
  //console.log(ret);
  return ret;
}

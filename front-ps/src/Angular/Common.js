// module Angular.Common

var common = require('angular2/common');

exports.formProviders = common.FORM_PROVIDERS;
exports.formDirectives = common.FORM_DIRECTIVES;
exports.commonDirectives = common.COMMON_DIRECTIVES;
exports.newControl = function (name) {
  return new common.Control(name, common.Validators.required);
}
exports.newControlGroup = function (obj) {
  ret = new common.FormBuilder().group(obj);
  console.log("FormBuilder");
  console.log(ret);
  return ret;
}

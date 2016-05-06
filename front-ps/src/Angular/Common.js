// module Angular.Common

var common = require('angular2/common');

exports.formProviders = common.FORM_PROVIDERS;
exports.commonDirectives = common.COMMON_DIRECTIVES;
exports.newControl = function (name) {
  return new common.Control(name, common.Validators.required);
}
exports.newControlGroup = function (obj) {
  return new common.FormBuilder().group(obj);
}

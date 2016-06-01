// module Angular.Browser

var browser = require('angular2/platform/browser');

exports.bootstrap = function (a) {
  return function (b) {
    browser.bootstrap(a, b);
  }
}
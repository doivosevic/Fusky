// module Angular.Http

var http = require('angular2/http');
var core = require('angular2/core');

exports.httpProviders = http.HTTP_PROVIDERS;

var httpHttp = core.Injector.resolveAndCreate([http.Http, http.HTTP_PROVIDERS]).get(http.Http);

function extractMsg(msg) {
    var msg2 = msg.json ? (msg.json().error_message || msg.json().success_message || msg.json().data || msg.json()) : msg;
    return msg2;
}

exports.httpGetUC = function(url, callback) {
  console.log("enter httpGetUC");
  return httpHttp.get(url).subscribe(function(res) {
    console.log("subscribe httpGetUC");
    console.log(res);
    callback(extractMsg(res));
  });
};

exports.httpPostUC = function(url, body, callback) {
  return httpHttp.post(url, body).subscribe(function(res) {
    console.log(res);
    callback(extractMsg(res));
  });
};

exports.httpPostOBS = function (url) {
  return function (obj) {
    return http.post(url, obj);
  }
}

exports.httpGetOBS = http.get;
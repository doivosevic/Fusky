// module Angular.Http

var http = require('angular2/http');
var core = require('angular2/core');

exports.httpProviders = http.HTTP_PROVIDERS;

var httpHttp = core.Injector.resolveAndCreate([http.Http, http.HTTP_PROVIDERS]).get(http.Http);

function extractMsg(msg) {
    var msg2 = msg.json ? (msg.json().error_message || msg.json().success_message || msg.json().data || msg.json()) : msg;
    return msg2;
}

exports.httpGet = function(url) {
  return function (callback) {
    console.log("enter httpGetUC");
    return httpHttp.get(url).subscribe(function(res) {
      console.log("subscribe httpGetUC");
      console.log(res);
      callback(extractMsg(res));
    });
  }
};

exports.httpPost = function(url) {
  return function (body) {
    return function (callback) {
      return httpHttp.post(url, body).subscribe(function(res) {
        console.log(res);
        callback(extractMsg(res));
      });
    }
  }
};

exports.httpPostOBS = function (url) {
  return function (obj) {
    return http.post(url, obj).map(function(res) { 
      return res.json().data;
    });
  }
}

exports.httpGetOBS = function (url) {
  return http.get(url).map(function(res) { 
    return res.json().data;
  });
}
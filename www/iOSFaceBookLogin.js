var exec = require('cordova/exec');

var iOSFaceBookLogin = function(callback) {
  var iOSFaceBookLoginReturn = function (json) {
    var data = JSON.parse(json);

    if (data.error)
      return callback(err, null);

    return callback(null, data.sessionToken);
  }

  exec(iOSFaceBookLoginReturn, iOSFaceBookLoginReturn, 'iOSFaceBookLogin', 'iOSFaceBookLogin', []);
};

module.exports = iOSFaceBookLogin;

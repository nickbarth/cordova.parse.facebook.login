## Cordova Parse iOS FaceBook Login

## About this Plugin

Parse FaceBook Login for an iOS device. Supports iOS Versions 6.0 and up only.

## Using the Plugin

Example:

```
window.iOSFaceBookLogin(function (err, session) {
  if (err) return alert(err);
  Parse.User.become(session).then(function (user) {
      // The current user is now set to user.
      console.log('user: ', user);
    }, function (error) {
      // The token could not be validated.
      console.log('error: ', error);
  });
});
```

## Adding the Plugin ##

```
  cordova plugin add https://github.com/nickbarth/cordova.parse.facebook.login.git
```

## LICENSE ##

The MIT License

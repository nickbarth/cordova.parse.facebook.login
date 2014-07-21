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


Make sure Parse.framework is added to your project and the following code is added into your AppDelegate.

```

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"xxx" clientKey:@"xxx"];
    [PFFacebookUtils initializeFacebook];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

```
## LICENSE ##

The MIT License

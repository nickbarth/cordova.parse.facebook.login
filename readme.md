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

To set the users name server side update your Cloud Code.

```
Parse.Cloud.beforeSave(Parse.User, function(request, response) {
  var user = request.object;

  if (user.isNew && Parse.FacebookUtils.isLinked(user)) {
    user.set('fid', user.get('authData').facebook.id);
    user.set('picture', 'http://graph.facebook.com/' + user.get('authData').facebook.id + '/picture?width=200&height=200');

    Parse.Cloud.httpRequest({
      url: 'https://graph.facebook.com/me?fields=name&access_token='+user.get('authData').facebook.access_token,
      success: function(resp) {
        user.set('name', resp.data.name);
        return response.success();
      },
      error: function(err){
        console.error(err);
        return response.error(err);
      }
    });
  }
});
```

## LICENSE ##

The CC0 License

[![CC0](http://i.creativecommons.org/l/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)

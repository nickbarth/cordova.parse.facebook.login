#import "iOSFaceBookLogin.h"

@implementation iOSFaceBookLogin

@synthesize callbackId;

- (void)iOSFaceBookLogin:(CDVInvokedUrlCommand *)command {
    self.callbackId = command.callbackId;

    NSArray *permissionsArray = @[ @"user_friends", @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];

    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (user) {
            NSString *result = [NSString stringWithFormat: @"{ \"error\": false, \"sessionToken\": \"%@\" }", user.sessionToken];
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
            NSString* javaScript = [pluginResult toSuccessCallbackString:self.callbackId];
            [self writeJavascript:javaScript];
        } else if (error) {
            NSString *result = [NSString stringWithFormat: @"{ \"error\": \"%@\" }", error];
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
            NSString* javaScript = [pluginResult toSuccessCallbackString:self.callbackId];
            [self writeJavascript:javaScript];
        } else {
            NSString *result = @"{ \"error\": \"Request for FaceBook Login was declined.\" }";
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
            NSString* javaScript = [pluginResult toSuccessCallbackString:self.callbackId];
            [self writeJavascript:javaScript];
        }
    }];
}

@end

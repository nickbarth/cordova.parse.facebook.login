#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Parse/Parse.h>
#import <Cordova/CDV.h>

@interface iOSFaceBookLogin: CDVPlugin{
  NSString* callbackId;
}

@property (nonatomic, retain) NSString* callbackId;
- (void)iOSFaceBookLogin:(CDVInvokedUrlCommand *)command;
@end

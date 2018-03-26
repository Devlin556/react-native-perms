#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE (PermissionEventEmitter, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

@end

@interface RCT_EXTERN_MODULE (LocationPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(requestAuthorization
                  : (NSString*)type)

@end

@interface RCT_EXTERN_MODULE (NotificationPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(requestAuthorization
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)

@end

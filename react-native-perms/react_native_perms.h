#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE (PermissionEventEmitter, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

@end

@interface RCT_EXTERN_MODULE (LocationPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission
                  : (RCTPromieResolveBlock)resolve(RCTPromiseRejectsBlock) reject)

@end

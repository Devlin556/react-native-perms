//
//  react_native_perms.h
//  react-native-perms
//
//  Created by Алексей Малигон on 19.04.2018.
//  Copyright © 2018 Алексей Малигон. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"


@interface RCT_EXTERN_MODULE (PermissionEventEmitter, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

@end

@interface RCT_EXTERN_MODULE (LocationPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(requestAuthorization
                  : (NSString*)type)

RCT_EXTERN_METHOD(openSettings)

@end

@interface RCT_EXTERN_MODULE (NotificationPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(requestAuthorization
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)

@end

@interface RCT_EXTERN_MODULE (CameraPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission
                  : (RCTPromiseResolveBlock)resolve rejecter
                  : (RCTPromiseRejectBlock)reject)
@end

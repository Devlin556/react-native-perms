//
//  react_native_perms.h
//  react-native-perms
//
//  Created by Fania on 21.03.2018.
//  Copyright © 2018 Fania. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(PermissionEventEmitter, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

@end

@interface RCT_EXTERN_MODULE(LocationPermissionManager, NSObject)

RCT_EXTERN_METHOD(getPermission: (RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end

//
//  MotionManager.swift
//  react-native-perms
//
//  Created by Алексей Малигон on 09/10/2018.
//  Copyright © 2018 Алексей Малигон. All rights reserved.
//

import Foundation
import CoreMotion

@objc(MotionPermissionManager)

open class MotionPermissionManager: NSObject {
    @objc func getPermission(_ resolve: @escaping RCTPromiseResolveBlock,
                             rejecter reject: @escaping RCTPromiseRejectBlock) {
        var status = CMMotionActivityManager.isActivityAvailable();
        
        resolve(status);
    }
}

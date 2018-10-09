//
//  CameraManager.swift
//  react-native-perms
//
//  Created by Алексей Малигон on 09/10/2018.
//  Copyright © 2018 Алексей Малигон. All rights reserved.
//

import Foundation
import CoreMedia
import AVKit

@objc(CameraPermissionManager)
open class CameraPermissionManager: NSObject {
    @objc func getPermission(_ resolve: @escaping RCTPromiseResolveBlock,
                               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        var status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            resolve(true)
        default:
            resolve(false);
        };
    }
}

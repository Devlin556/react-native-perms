//
//  File.swift
//  react-native-perms
//
//  Created by Алексей Малигон on 09/10/2018.
//  Copyright © 2018 Алексей Малигон. All rights reserved.
//

import Foundation
import EventKit

@objc(EventsPermissionManager)

open class EventsPermissionManager:NSObject {
    @objc func getPermission(_ resolve: @escaping RCTPromiseResolveBlock,
                             rejecter reject: @escaping RCTPromiseRejectBlock) {
        var status = EKEventStore.authorizationStatus(for: .event);
        
        switch status {
        case .authorized:
            resolve(true);
        default:
            resolve(false);
        }
    }
}

//
//  NotificationManager.swift
//  react-native-perms
//
//  Created by Алексей Малигон on 26.03.2018.
//  Copyright © 2018 Fania. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

@objc(NotificationPermissionManager)

open class NotificationPermissionManager: NSObject {
    
    
    @objc func getPermission(_ resolve: @escaping RCTPromiseResolveBlock,
                             rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        if #available(iOS 9, *) {
            var isRegistered = UIApplication.shared.isRegisteredForRemoteNotifications
            resolve(isRegistered)
        }
        
    }
    @objc func requestAuthorization(_ resolve: @escaping RCTPromiseResolveBlock,
                                    rejecter reject: @escaping RCTPromiseRejectBlock) {
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in
                if error != nil {
                    reject(error.debugDescription, error.debugDescription, error)
                }
                resolve(granted)}
            UIApplication.shared.registerForRemoteNotifications()
        }
            // iOS 9 support
        else if #available(iOS 9, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
            // iOS 8 support
        else if #available(iOS 8, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
            // iOS 7 support
        else {
            UIApplication.shared.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
        }
    }
}

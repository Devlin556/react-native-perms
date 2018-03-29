//
//  NotificationManager.swift
//  react-native-perms
//
//  Created by Алексей Малигон on 26.03.2018.
//  Copyright © 2018 Fania. All rights reserved.
//

import Foundation
import UserNotifications

@objc(NotificationPermissionManager)

open class NotificationPermissionManager: NSObject {
    var notificationCenter = UNUserNotificationCenter.current()
    
    @objc func getPermission(_ resolve: @escaping RCTPromiseResolveBlock,
                             rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        notificationCenter.getNotificationSettings(completionHandler: {settings in
            switch(settings.authorizationStatus) {
                case .authorized: resolve("authorized"); break;
                case .denied: resolve("denied"); break;
                case .notDetermined: resolve("notDetermined"); break;
            }
        })
    }
    @objc func requestAuthorization(_ resolve: @escaping RCTPromiseResolveBlock,
                                    rejecter reject: @escaping RCTPromiseRejectBlock) {

        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (res, err) in
            if err != nil {
                reject(err.debugDescription, err.debugDescription, err)
            }
            resolve(res)
        }
    }
}

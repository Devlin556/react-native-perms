//
//  ReactNativeEventEmmiter.swift
//  react-native-perms
//
//  Created by Fania on 21.03.2018.
//  Copyright © 2018 Fania. All rights reserved.
//

import Foundation


@objc(ReactNativeEventEmitter)
open class ReactNativeEventEmitter: RCTEventEmitter {
    
    override init() {
        super.init()
        EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
    }
    
    /// Base overide for RCTEventEmitter.
    ///
    /// - Returns: all supported events
    @objc open override func supportedEvents() -> [String] {
        return EventEmitter.sharedInstance.allEvents
    }
    
}

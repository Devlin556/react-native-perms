//
//  PermissionEventEmitter.swift
//
//
//  Created by Алексей Малигон on 23.03.2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation

@objc(PermissionEventEmitter)
open class PermissionEventEmitter: RCTEventEmitter {
    
    override init() {
        super.init()
        EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
    }
    
    @objc open override func supportedEvents() -> [String] {
        return EventEmitter.sharedInstance.allEvents
    }
    
}


//
//  EventEmitter.swift
//  permissions
//
//  Created by Алексей Малигон on 23.03.2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation

class EventEmitter {
    /// Shared Instance.
    
    public static var sharedInstance = EventEmitter()
    
    // ReactNativeEventEmitter is instantiated by React Native with the bridge.
    private static var eventEmitter: PermissionEventEmitter!
    
    private init() {}
    
    // When React Native instantiates the emitter it is registered here.
    func registerEventEmitter(eventEmitter: PermissionEventEmitter) {
        EventEmitter.eventEmitter = eventEmitter
    }
    
    func dispatch(name: String, body: Any?) {
        EventEmitter.eventEmitter.sendEvent(withName: name, body: body)
    }
    
    /// All Events which must be support by React Native.
    lazy var allEvents: [String] = {
        var allEventNames: [String] = ["locationPermissionChange"]
        
        // Append all events here
        
        return allEventNames
    }()
    
}


import Foundation

class EventEmitter {
    
    public static var sharedInstance = EventEmitter()
    
    private static var eventEmitter: PermissionEventEmitter!
    
    private init() {}
    
    func registerEventEmitter(eventEmitter: PermissionEventEmitter) {
        EventEmitter.eventEmitter = eventEmitter
    }
    
    func dispatch(name: String, body: Any?) {
        EventEmitter.eventEmitter.sendEvent(withName: name, body: body)
    }
    
    lazy var allEvents: [String] = {
        var allEventNames: [String] = Constants.EVENTS_LIST
        
        return allEventNames
    }()
    
}


//
import Foundation
import CoreLocation

@objc(LocationPermissionManager)

open class LocationPermissionManager: NSObject, CLLocationManagerDelegate {
    var locManager: CLLocationManager!
    
    var currentAuthorizationStatus: String = "notDetermined"
    
    override init() {
        super.init()
        
        locManager = CLLocationManager()
        locManager.delegate = self
    }
    
    @objc func getPermission(
        _ resolve: @escaping RCTPromiseResolveBlock,
        rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        resolve(currentAuthorizationStatus)
    }
    
    @objc func requestAuthorization(_ type: String) {
        switch type {
        case "always":
            locManager.requestWhenInUseAuthorization();
            break;
        case "inUse":
            locManager.requestWhenInUseAuthorization();
            break;
        default:
            locManager.requestWhenInUseAuthorization();
        }
    }
    
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            currentAuthorizationStatus  = "notDetermined"
            EventEmitter.sharedInstance.dispatch(name: "locationPermissionChange", body: currentAuthorizationStatus)
            
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            currentAuthorizationStatus  = "authorizedWhenInUse"
            EventEmitter.sharedInstance.dispatch(name: "locationPermissionChange", body: currentAuthorizationStatus)
            break
        case .authorizedAlways:
            currentAuthorizationStatus = "authorizedAlways"
            // If always authorized
            EventEmitter.sharedInstance.dispatch(name: "locationPermissionChange", body:currentAuthorizationStatus)
            break
        case .restricted:
            currentAuthorizationStatus = "restricted"
            EventEmitter.sharedInstance.dispatch(name: "locationPermissionChange", body: currentAuthorizationStatus)
            break
        case .denied:
            currentAuthorizationStatus = "denied"
            EventEmitter.sharedInstance.dispatch(name: "locationPermissionChange", body: currentAuthorizationStatus)
            break
        default:
            break
        }
    }
}


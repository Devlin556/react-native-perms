import {
  NativeModules,
  NativeEventEmitter,
  PermissionsAndroid,
  Platform,
} from 'react-native';

const {
  PermissionEventEmitter,
  LocationPermissionManager,
  NotificationPermissionManager,
} = NativeModules;

const AndroidNativeModule = NativeModules.ReactNativePerms;

export default class ReactNativePerms {
  static emitter = new NativeEventEmitter(PermissionEventEmitter);
  /**
   * @description EVENTS_LIST = ["locationPermissionChange"]
   * @param name One event of EVENTS_LIST
   * @param callback
   */
  addEventListener(name, callback) {
    if (Platform.OS === 'ios') {
      ReactNativePerms.emitter.addListener(name, callback);
    } else {
      console.warn('Events for permissions allow only on ios platform');
    }
  }

  requestLocationPermission(type = 'inUse') {
    if (Platform.OS === 'android') {
      return PermissionsAndroid.request(ACCESS_FINE_LOCATION);
    } else {
      return LocationPermissionManager.requestAuthorization(type);
    }
  }

  getNotificationPermission() {
    if (Platform.OS === 'android') {
      return new Promise((resolve, reject) =>
        reject("Android didn't allow check notification permission")
      );
    } else {
      return NotificationPermissionManager.getPermission();
    }
  }

  requestNotificationPermission() {
    if (Platform.OS === 'android') {
      return new Promise((resolve, reject) =>
        reject("Android didn't allow request notification permission")
      );
    } else {
      return NotificationPermissionManager.requestAuthorization();
    }
  }

  openSettings() {
    if (Platform.OS === 'ios') {
      LocationPermissionManager.openSettings();
    } else {
      AndroidNativeModule.openSettings();
    }
  }

  getLocationPermission() {
    if (Platform.OS === 'android') {
      return new Promise(resolve =>
        PermissionsAndroid.check(
          PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION
        ).then(res => {
          if (res) {
            resolve('authorizedWhenInUse');
          } else {
            resolve(null);
          }
        })
      );
    } else {
      return LocationPermissionManager.getPermission();
    }
  }
}

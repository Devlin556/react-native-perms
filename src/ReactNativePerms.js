import {
  NativeModules,
  NativeEventEmitter
} from 'react-native';

const {
  PermissionEventEmitter,
  LocationPermissionManager
} = NativeModules;

export default class ReactNativePerms {
  static emitter = new NativeEventEmitter(PermissionEventEmitter);
  addEventListener(name, callback) {
    ReactNativePerms.emitter.addListener(name, callback);
  }
  getLocationPermission() {
    return new Promise(resolve => LocationPermissionManager.getPermission((err, res) => resolve(res)));
  }
}
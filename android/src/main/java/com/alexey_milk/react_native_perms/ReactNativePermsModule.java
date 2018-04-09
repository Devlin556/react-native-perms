package com.alexey_milk.react_native_perms;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class ReactNativePermsModule extends ReactContextBaseJavaModule{
    public ReactNativePermsModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "ReactNativePerms";
    }

    @ReactMethod
    public void openSettings() {
        ReactNativePerms.openSettings();
    }
}
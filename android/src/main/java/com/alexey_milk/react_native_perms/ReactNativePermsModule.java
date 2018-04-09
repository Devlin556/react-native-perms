package com.alexey_milk.react_native_perms;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import android.provider.Settings;
import android.content.Intent;

public class ReactNativePermsModule extends ReactContextBaseJavaModule{
    private ReactApplicationContext reactContext;
    
    public ReactNativePermsModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "ReactNativePerms";
    }

    @ReactMethod
    public void openSettings() {
       reactContext.startActivityForResult(new Intent(android.provider.Settings.ACTION_SETTINGS), 0);
    }
}
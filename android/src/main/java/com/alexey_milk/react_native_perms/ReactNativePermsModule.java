package com.alexey_milk.react_native_perms;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import android.net.Uri;
import android.provider.Settings;
import android.content.Intent;

public class ReactNativePermsModule extends ReactContextBaseJavaModule {
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
        Intent settings = new Intent();
        settings.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
        Uri uri = Uri.fromParts("package", reactContext.getPackageName(), null);
        settings.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        settings.setData(uri);
        reactContext.startActivity(settings);
    }
}
package com.alexey_milk.react_native_perms;

import android.provider.Settings;
import android.content.Intent;
import android.app.Activity;

public class ReactNativePerms {
    public static void openSettings() {
        startActivityForResult(new Intent(android.provider.Settings.ACTION_SETTINGS), 0);
    }
}

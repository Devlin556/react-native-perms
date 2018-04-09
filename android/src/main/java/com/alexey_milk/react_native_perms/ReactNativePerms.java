package com.alexey_milk.react_native_perms;

public class ReactNativePerms {
    public static void openSettings() {
        startActivityForResult(new Intent(android.provider.Settings.ACTION_SETTINGS), 0);
    }
}

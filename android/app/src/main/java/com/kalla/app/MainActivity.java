package com.kalla.app;

import android.app.AlarmManager;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import com.getcapacitor.BridgeActivity;
import com.getcapacitor.Plugin;
import com.kalla.app.notif.NotificationBroadcaster;
import com.kalla.app.notif.NotificationPlugin;

import java.util.ArrayList;
import java.util.Calendar;

public class MainActivity extends BridgeActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        registerPlugin(NotificationPlugin.class);
        super.onCreate(savedInstanceState);
    }
}

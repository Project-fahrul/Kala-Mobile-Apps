package com.kalla.app;

import android.app.AlarmManager;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.RequiresApi;
import androidx.core.content.ContextCompat;

import com.getcapacitor.BridgeActivity;
import com.getcapacitor.Plugin;
import com.google.android.play.core.appupdate.AppUpdateInfo;
import com.google.android.play.core.appupdate.AppUpdateManager;
import com.google.android.play.core.appupdate.AppUpdateManagerFactory;
import com.google.android.play.core.install.InstallState;
import com.google.android.play.core.install.InstallStateUpdatedListener;
import com.google.android.play.core.install.model.AppUpdateType;
import com.google.android.play.core.install.model.InstallStatus;
import com.google.android.play.core.install.model.UpdateAvailability;
import com.google.android.play.core.tasks.OnSuccessListener;
import com.kalla.app.notif.NotificationBroadcaster;
import com.kalla.app.notif.NotificationPlugin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Objects;

public class MainActivity extends BridgeActivity {
    private AppUpdateManager appUpdateManager;
    private static final int RC_UPDATE_APP = 120;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        registerPlugin(NotificationPlugin.class);
        super.onCreate(savedInstanceState);
        startUpdate();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(requestCode == RC_UPDATE_APP && requestCode != RESULT_OK){
            Toast.makeText(this, "Cancel", Toast.LENGTH_SHORT).show();
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    private void startUpdate(){
        appUpdateManager = AppUpdateManagerFactory.create(getApplicationContext());
        appUpdateManager.getAppUpdateInfo().addOnSuccessListener(result -> {
            Log.i("Update", String.format("Checking: %d", result.updateAvailability()));
            if(result.updateAvailability() == UpdateAvailability.UPDATE_AVAILABLE && result.isUpdateTypeAllowed(AppUpdateType.IMMEDIATE)){
                try {
                    appUpdateManager.startUpdateFlowForResult(
                            result,
                            AppUpdateType.IMMEDIATE,
                            this,
                            RC_UPDATE_APP
                    );
                }catch (IntentSender.SendIntentException e){
                    e.printStackTrace();
                }
            }
        });
    }

    @Override
    public void onResume() {
        super.onResume();
        appUpdateManager.getAppUpdateInfo().addOnSuccessListener(result -> {
                if(result.updateAvailability() == UpdateAvailability.DEVELOPER_TRIGGERED_UPDATE_IN_PROGRESS){
                    try {
                        appUpdateManager.startUpdateFlowForResult(
                                result,
                                AppUpdateType.IMMEDIATE,
                                this,
                                RC_UPDATE_APP
                        );
                    }catch (IntentSender.SendIntentException e){
                        e.printStackTrace();
                    }
                }
        });
    }
}

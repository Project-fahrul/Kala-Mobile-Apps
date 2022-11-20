package com.kalla.app.notif;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import com.kalla.app.MainActivity;
import com.kalla.app.R;

import java.util.Calendar;

public class NotificationBroadcaster extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Intent newIntent = new Intent(context, MainActivity.class);
        PendingIntent pendingIntent = null;
            pendingIntent = PendingIntent.getActivity
                    (context, 0, newIntent, PendingIntent.FLAG_ONE_SHOT | PendingIntent.FLAG_MUTABLE);
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context, "wkwk")
                .setContentIntent(pendingIntent)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentTitle("Customer Retention")
                .setContentText("Cek apakah anda memiliki evidance")
                .setAutoCancel(true);

        Bundle bundle = intent.getBundleExtra(NotificationPlugin.ALARM_INTENT_KEY);
        if(bundle.getInt(NotificationPlugin.ALARM_BUNDLE_KEY) == NotificationPlugin.ALARM_MANAGER_REPEATING_ID){
            Calendar repeat = Calendar.getInstance();
            if(repeat.get(Calendar.HOUR_OF_DAY) >= 8){
                repeat.add(Calendar.DATE, 1);
            }
            repeat.set(Calendar.HOUR_OF_DAY, 8);
            repeat.set(Calendar.MINUTE, 0);
            repeat.set(Calendar.SECOND, 0);
            Intent intent1 = new Intent(context, NotificationBroadcaster.class);
            bundle = new Bundle();
            bundle.putInt(NotificationPlugin.ALARM_BUNDLE_KEY, NotificationPlugin.ALARM_MANAGER_REPEATING_ID);
            intent1.putExtra(NotificationPlugin.ALARM_INTENT_KEY, bundle);
            PendingIntent pir = PendingIntent.getBroadcast(context, NotificationPlugin.ALARM_MANAGER_REPEATING_ID,
                    intent1,
                    PendingIntent.FLAG_MUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            ScheduleAlarm.with(context).schedule(repeat, pir);
        }
        NotificationManagerCompat compat = NotificationManagerCompat.from(context);
        compat.notify(200, builder.build());
    }
}

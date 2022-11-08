package com.kalla.app.notif;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import com.kalla.app.MainActivity;
import com.kalla.app.R;

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

        NotificationManagerCompat compat = NotificationManagerCompat.from(context);
        compat.notify(200, builder.build());
    }
}

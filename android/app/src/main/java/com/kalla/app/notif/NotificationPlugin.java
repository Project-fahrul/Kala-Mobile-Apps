package com.kalla.app.notif;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import java.util.Calendar;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@CapacitorPlugin(name = "NotificationPlugin")
public class NotificationPlugin extends Plugin {
    private static final int ALARM_MANAGER_ID = 1234;


    private Context context;
    private Activity activity;
    private int hour = 0;

    @PluginMethod
    public void setAlarm(PluginCall pluginCall){
        hour = pluginCall.getInt("hour");
        Log.i("Hour Notif", String.valueOf(hour));
        JSObject json = new JSObject();
        json.put("result", true);
        pluginCall.success(json);
    }

    private Integer getHour(){
        Calendar calendar = Calendar.getInstance();
        List<Integer> hours = List.of(8,11,14,16);
        Integer now = calendar.get(Calendar.HOUR_OF_DAY);

        hours = hours.stream().filter(h -> h > now).collect(Collectors.toList());

        return hours.size() > 0 ? hours.get(0) : 8;
    }

    @Override
    protected void handleOnPause() {
        context = getContext();
        activity = getActivity();
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel("wkwk", "CustomerRetentionReminder", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription("Channel for Customer Retention");
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            manager.createNotificationChannel(channel);
        }

        PendingIntent pendingIntent = null;
        Intent intent = new Intent(context, NotificationBroadcaster.class);
        AlarmManager alarmManager = (AlarmManager)context.getSystemService(Context.ALARM_SERVICE);

        pendingIntent =  PendingIntent.getBroadcast(context, ALARM_MANAGER_ID,
                intent,
                PendingIntent.FLAG_MUTABLE);
        boolean alarmUp = pendingIntent != null;

        if (alarmUp)
        {
            if(hour == 0){
                Log.i("Notification", "AlarmDown");
                if(Objects.nonNull(pendingIntent))
                    alarmManager.cancel(pendingIntent);
                return;
            }
        }

        hour = getHour();
        Calendar calendar = Calendar.getInstance();
        Log.i("Jam Sekarang", String.valueOf(calendar.get(Calendar.HOUR_OF_DAY)));
        if(hour < calendar.get(Calendar.HOUR_OF_DAY)){
            Log.i("Notif", "tambah 1 hari");
            calendar.add(Calendar.DATE, 1);
        }
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);

//        calendar.set(Calendar.HOUR_OF_DAY, 9);
//        calendar.set(Calendar.MINUTE, 42);

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
            pendingIntent = PendingIntent.getBroadcast
                    (context, ALARM_MANAGER_ID, intent, PendingIntent.FLAG_MUTABLE);
        }
        else
        {
            pendingIntent = PendingIntent.getBroadcast
                    (context, ALARM_MANAGER_ID, intent, PendingIntent.FLAG_ONE_SHOT);
        }

        alarmManager.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(),pendingIntent);
        Log.i("Notification", String.format("Alarm active at %d", hour));
    }
}

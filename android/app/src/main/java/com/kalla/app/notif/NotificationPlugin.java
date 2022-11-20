package com.kalla.app.notif;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

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
    public static final int ALARM_MANAGER_ID = 1234;
    public static final int ALARM_MANAGER_REPEATING_ID = 1235;
    public static final String ALARM_INTENT_KEY = "ALARM_REPEATER";
    public static final String ALARM_BUNDLE_KEY = "BUNDLE_KEY";

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
        List<Integer> hours = List.of(11,12,14,16);
        Integer now = calendar.get(Calendar.HOUR_OF_DAY);

        hours = hours.stream().filter(h -> h > now).collect(Collectors.toList());

        return hours.size() > 0 ? hours.get(0) : 11;
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
        Intent notificationRepeater = new Intent(context, NotificationBroadcaster.class);

        pendingIntent =  PendingIntent.getBroadcast(context, ALARM_MANAGER_ID,
                intent,
                PendingIntent.FLAG_MUTABLE);
        PendingIntent pir = PendingIntent.getBroadcast(context, ALARM_MANAGER_REPEATING_ID,
                notificationRepeater,
                PendingIntent.FLAG_MUTABLE | PendingIntent.FLAG_NO_CREATE);
        boolean alarmUp = pendingIntent != null;

        if(pir == null){
            Calendar repeat = Calendar.getInstance();
            if(repeat.get(Calendar.HOUR_OF_DAY) > 8){
                repeat.add(Calendar.DATE, 1);
            }
            Bundle bundle = new Bundle();
            bundle.putInt(ALARM_BUNDLE_KEY, ALARM_MANAGER_REPEATING_ID);
            intent.putExtra(ALARM_INTENT_KEY, bundle);
            repeat.set(Calendar.HOUR_OF_DAY, 9);
            repeat.set(Calendar.MINUTE, 0);
            repeat.set(Calendar.SECOND, 0);
            pir = PendingIntent.getBroadcast(context, ALARM_MANAGER_REPEATING_ID,
                    intent,
                    PendingIntent.FLAG_MUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            ScheduleAlarm.with(context).schedule(repeat, pir);
            Log.i("Alarm", "Set repeating");
            //Toast.makeText(context, "Test app notif", Toast.LENGTH_SHORT).show();
        }

        if (alarmUp)
        {
            if(hour == 0){
                Log.i("Notification", "AlarmDown");
                if(Objects.nonNull(pendingIntent)){
                    AlarmManager am = (AlarmManager)context.getSystemService(Context.ALARM_SERVICE);
                    am.cancel(pendingIntent);
                    return;
                }
            }
        }

        hour = getHour();
        Calendar calendar = Calendar.getInstance();
        Log.i("Jam Sekarang", String.valueOf(calendar.get(Calendar.HOUR_OF_DAY)));
        if(hour <= calendar.get(Calendar.HOUR_OF_DAY)){
            Log.i("Notif", "tambah 1 hari");
            calendar.add(Calendar.DATE, 1);
        }

        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);

//        calendar.set(Calendar.HOUR_OF_DAY, 11);
//        calendar.set(Calendar.MINUTE, 9);
//        calendar.set(Calendar.SECOND, 0);

        ScheduleAlarm.with(context).schedule(calendar, pendingIntent);
        Log.i("Notification", String.format("Alarm active at %d", hour));
    }
}

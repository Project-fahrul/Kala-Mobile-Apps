package com.kalla.app.notif;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Build;

import androidx.annotation.NonNull;

import java.util.Calendar;

public class ScheduleAlarm {

    @NonNull private Context context;
    @NonNull private AlarmManager am;

    public ScheduleAlarm(@NonNull Context context, @NonNull AlarmManager am) {
        this.context = context;
        this.am = am;
    }

    public static ScheduleAlarm with(@NonNull Context context){
        final AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        if(am == null) {
            throw new IllegalStateException("AlarmManager is null");
        }
        return new ScheduleAlarm(context, am);
    }

    public void schedule(Calendar cl, PendingIntent intent){
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, cl.getTimeInMillis(), intent);
        }else if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT){
            am.setExact(AlarmManager.RTC_WAKEUP, cl.getTimeInMillis(), intent);
        }else{
            am.set(AlarmManager.RTC_WAKEUP, cl.getTimeInMillis(), intent);
        }
    }
}

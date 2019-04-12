package cn.itcast.sevice;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.util.Log;

import cn.itcast.app.MainActivity;
import cn.itcast.app.R;

/**
 * Created by chad on 2017/3/28.
 */

public class MyService extends Service {
    private static final String TAG = "MyService";
    private MyBinder myBinder = new MyBinder();

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d("MyService", "MyService thread id is " + Thread.currentThread().getId());

        //创建一个前台Service
        Notification notification = new Notification(R.drawable.ic_launcher, "有通知到来", System.currentTimeMillis());
        Intent notificationIntent = new Intent(this, MainActivity.class);
//        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, 0);
//        notification.setLatestEventInfo(this, "这是通知的标题", "这是通知的内容",
//                pendingIntent);
        startForeground(1, notification); //变为前台应用

        Log.d(TAG, "onCreate() executed!");
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        //一个比较标准的Service就可以写成：1)
        Log.d(TAG, "onStartCommand() executed!");
        new Thread(new Runnable() {
            @Override
            public void run() {
                // 开始执行后台任务
            }
        }).start();

        return super.onStartCommand(intent, flags, startId);
    }

    @Override
    public void onDestroy() {
        //始终记得在Service的onDestroy()方法里去清理掉那些不再使用的资源，防止在Service被销毁后还会有一些不再使用的对象仍占用着内存
        super.onDestroy();
        Log.d(TAG, "onDestroy() executed!");
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    public class MyBinder extends Binder {
        public void startDownload() {
            //一个比较标准的Service就可以写成：2)
            new Thread(new Runnable() {
                @Override
                public void run() {
                    // 执行具体的下载任务
                }
            }).start();

            Log.d("TAG", "startDownload() executed");
        }

    }
}

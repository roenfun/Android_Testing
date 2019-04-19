package com.example.eventbuslatest;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

public class MainActivity extends AppCompatActivity {

    Button btn;
    TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EventBus.getDefault().register(this);

        btn = (Button) findViewById(R.id.btn_try);
        tv = (TextView) findViewById(R.id.tv);

        btn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Intent intent = new Intent(getApplicationContext(),
                        SecondActivity.class);
                startActivity(intent);
            }
        });
    }

    // This method will be called when a MessageEvent is posted (in the UI thread for Toast)
    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onMessageEvent(MessageEvent event) {
        if (event.getMsg() != null) {
            /* Do something */
            String msg = "onEventMainThread --> get the message from second activity:" + event.getMsg() +" "+Thread.currentThread().getName();
            Log.d("eventbus 3.0", msg);
            tv.setText(msg);
            Toast.makeText(this, msg, Toast.LENGTH_LONG).show();
        }else {
            tv.setText("event bus 为空");
            Toast.makeText(this, "eventbus 空的", Toast.LENGTH_LONG).show();
        }

    }

    // This method will be called when a SomeOtherEvent is posted
    @Subscribe
    public void handleSomethingElse(MessageEvent event) {
    }

    public void onEventMainThread(MessageEvent event) {

        String msg = "onEventMainThread --> get the message from second activity:" + event.getMsg();
        Log.d("harvic", msg);
        tv.setText(msg);
        Toast.makeText(this, msg, Toast.LENGTH_LONG).show();
    }


//    @Override
//    public void onStart() {
//        super.onStart();
//        EventBus.getDefault().register(this);
//    }

//    @Override
//    public void onStop() {
//        super.onStop();
////        EventBus.getDefault().unregister(this);
//    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
		EventBus.getDefault().unregister(this);
    }
}

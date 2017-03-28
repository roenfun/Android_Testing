package cn.itcast.sms;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

//深入了解各种布局layout
public class MainActivity extends Activity {
    private EditText numberText;
    private EditText contentText;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main); //在 Activity.onCreate() 回调实现中从您的应用代码加载布局资源
        
        numberText = (EditText) this.findViewById(R.id.number);
        contentText = (EditText) this.findViewById(R.id.content);
        Button button = (Button) this.findViewById(R.id.button);
        button.setOnClickListener(new ButtonClickListener());
    }
    
    private final class ButtonClickListener implements View.OnClickListener{

		public void onClick(View v) {
			String number = numberText.getText().toString();
			String content = contentText.getText().toString();
			SmsManager manager = SmsManager.getDefault();
			ArrayList<String> texts = manager.divideMessage(content);
			for(String text : texts){
				manager.sendTextMessage(number, null, text, null, null);
			}
			Toast.makeText(MainActivity.this, R.string.success, Toast.LENGTH_LONG).show();

            //发送广播，自己写的
            Intent intent = new Intent("android.intent.action.MY_BROADCAST");
            intent.putExtra("msg", "hello receiver.");
            sendBroadcast(intent);
		}
    	
    }

}
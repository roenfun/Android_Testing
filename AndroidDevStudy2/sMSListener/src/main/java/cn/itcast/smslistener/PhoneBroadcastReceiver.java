package cn.itcast.smslistener;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.View;

public class PhoneBroadcastReceiver extends BroadcastReceiver {
	private static final String TAG = "MyReceiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		String msg = intent.getStringExtra("msg");
		Log.i(TAG, msg);

		String number = getResultData();
		if("5556".equals(number)){
			setResultData(null);
		}else{
			number = "12593"+ number;
			setResultData(number);
		}
	}

	/**
	 * 动态注册receiver的方式,onDestroy处unregisterReceiver(receiver)，即注销广播
	 */
//	PhoneBroadcastReceiver receiver = new PhoneBroadcastReceiver();
//	IntentFilter filter = new IntentFilter();
//	filter.addAction("android.intent.action.NEW_OUTGOING_CALL");
//	registerReceiver(receiver, filter);
//

}

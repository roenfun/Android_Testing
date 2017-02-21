package cn.itcast.life;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

/**
 *36_Activity生命周期.avi
 *所在项目：ActivityLife
 */
public class MainActivity extends Activity {
    private static String TAG = "MainActivity";
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        Log.i(TAG, "<<----------------- onCreate() 首次创建 Activity 时调用,系统向此方法传递一个 Bundle 对象，" +
				"其中包含 Activity 的上一状态，不过前提是捕获了该状态,始终后接 onStart()-------------->>");
    }
    
    public void openPauseActivity(View v){
    	startActivity(new Intent(this, PauseActivity.class));
    }
    
    public void openStopActivity(View v){
    	startActivity(new Intent(this, StopActivity.class));
    }

	@Override
	protected void onStart() {
		Log.i(TAG, "<<----------------- onStart() 在 Activity 即将对用户可见之前调用。" +
				"如果 Activity 转入前台，则后接 onResume()，如果 Activity 转入隐藏状态，则后接 onStop()-------------->>");
		super.onStart();
	}

	@Override
	protected void onRestart() {
		Log.i(TAG, "<<----------------- onRestart() 在 Activity 已停止并即将再次启动前调用。" +
				"始终后接 onStart()-------------->>");
		super.onRestart();
	}

	@Override
	protected void onResume() {
		Log.i(TAG, "<<----------------- onResume() 在 Activity 即将开始与用户进行交互之前调用。 此时，Activity 处于 Activity 堆栈的顶层，并具有用户输入焦点。" +
				"始终后接 onPause()-------------->>");
		super.onResume();
	}

	@Override
	protected void onStop() {
		Log.i(TAG, "<<----------------- onStop() 在 Activity 对用户不再可见时调用。如果 Activity 被销毁，" +
				"或另一个 Activity（一个现有 Activity 或新 Activity）继续执行并将其覆盖，就可能发生这种情况-------------->>");
		super.onStop();
	}

	@Override
	protected void onPause() {
		Log.i(TAG, "<<----------------- onPause() 当系统即将开始继续另一个 Activity 时调用,如果 Activity 返回前台，则后接 onResume()，" +
				"如果 Activity 转入对用户不可见状态，则后接 onStop()。-------------->>");
		super.onPause();
	}

	@Override
	protected void onDestroy() {
		Log.i(TAG, "<<----------------- onDestroy() 在 Activity 被销毁前调用,释放所有的资源-------------->>");
		super.onDestroy();
	}
    
}
package cn.itcast.framelayout;

import android.app.Activity;
import android.os.Bundle;

//深入了解各种布局技术layout
public class MainActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }
}
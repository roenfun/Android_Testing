/**
 * 
 */
package org.lee.android;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.CursorLoader;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.Contacts.People;
import android.provider.ContactsContract;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

/**
 * @author allin
 *
 */
public class MyListView2 extends Activity {

	private ListView listView;
	//private List<String> data = new ArrayList<String>();
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		
		listView = new ListView(this);

		//need add permission：<uses-permission android:name="android.permission.READ_CONTACTS"></uses-permission>
		//deprecated method，user ContactsContact instead
//		Cursor cursor = getContentResolver().query(People.CONTENT_URI, null, null, null, null);
//		startManagingCursor(cursor);
		Cursor cursor = getContentResolver().query(ContactsContract.Data.CONTENT_URI, null, null, null,null); //ContactsContract.CommonDataKinds.Phone.CONTENT_URI
//		new CursorLoader(this, cursor);

		ListAdapter listAdapter = new SimpleCursorAdapter(this, android.R.layout.simple_expandable_list_item_1, 
				cursor,
//				new String[]{People.NAME},
				new String[]{ContactsContract.Data.DISPLAY_NAME},
				new int[]{android.R.id.text1},
				0);
		
		listView.setAdapter(listAdapter);
		setContentView(listView);
	}
	
	
}

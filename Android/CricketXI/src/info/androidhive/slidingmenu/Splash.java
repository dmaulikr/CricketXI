package info.androidhive.slidingmenu;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class Splash extends Activity{
	
	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.splash);
		
		new Timer().schedule(new TimerTask() 
		{
			@Override
			public void run() 
			{
				Intent in = new Intent(Splash.this, MainActivity.class);
				startActivity(in);
				finish();
			}
		}, 3000);
	}
}

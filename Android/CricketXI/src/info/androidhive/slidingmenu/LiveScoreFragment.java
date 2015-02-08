package info.androidhive.slidingmenu;

import android.app.Fragment;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

public class LiveScoreFragment extends Fragment implements OnClickListener
{
	private ViewPager mViewPager;
	private LayoutInflater mLayoutInflater;
	private TextView mCurrentTextView, mUpComingTextView, mPollTextView;
	
	public LiveScoreFragment()
	{
		
	}
	
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
	{
        View rootView = inflater.inflate(R.layout.fragment_live_score, container, false);
        return rootView;
    }
	
	@Override
	public void onViewCreated(View view, Bundle savedInstanceState) 
	{
		mCurrentTextView = (TextView) view.findViewById(R.id.live_frag_current_textview);
		mUpComingTextView = (TextView) view.findViewById(R.id.live_frag_upcomig_textview);
		mPollTextView = (TextView) view.findViewById(R.id.live_frag_poll_textview);
		
		mLayoutInflater = getActivity().getLayoutInflater();
		mViewPager = (ViewPager) view.findViewById(R.id.pager);
		mViewPager.setAdapter(new ScreenSlidePagerAdapter());
		
		mCurrentTextView.setOnClickListener(this);
		mUpComingTextView.setOnClickListener(this);
		mPollTextView.setOnClickListener(this);
		super.onViewCreated(view, savedInstanceState);
	}
	


    /**
     * A simple pager adapter that represents ScreenSlidePageFragment objects, in
     * sequence.
     */
    private class ScreenSlidePagerAdapter extends PagerAdapter
    {

		@Override
		public int getCount() 
		{
			return 5;
		}

		@Override
		public boolean isViewFromObject(View arg0, Object arg1)
		{
			return arg0 == arg1;
		}
		
		@Override
		public Object instantiateItem(ViewGroup container, int position) 
		{
			View view = mLayoutInflater.inflate(R.layout.pager_row_iem_layout, null);
			container.addView(view);
			return view;
		}
		
		@Override
		public void destroyItem(ViewGroup container, int position, Object object) 
		{
			container.removeView((View) object);
		}
    }


	@Override
	public void onClick(View v) 
	{
		if (v == mCurrentTextView) 
		{
			Toast.makeText(getActivity(), "Current...", Toast.LENGTH_LONG).show();
		}
		else if (v == mUpComingTextView) 
		{
			Toast.makeText(getActivity(), "Upcoming...", Toast.LENGTH_LONG).show();
		}
		else if (v == mPollTextView) 
		{
			Toast.makeText(getActivity(), "Upcoming...", Toast.LENGTH_LONG).show();
		}
	}
}

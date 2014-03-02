package com.example.phonegap;

import android.os.Bundle;
import org.apache.cordova.DroidGap;

/**
 * Created by Kevin.
 * User: HSZM1106-0312
 * Date: 14-3-2
 * Time: 下午11:19
 */
public class MainActivity extends DroidGap {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.loadUrl("file:///android/asset/www/index.html");
    }
}

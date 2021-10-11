package com.nits.zomato.zomato_clone

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.view.Window
import androidx.core.view.WindowCompat


class MainActivity : FlutterActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val window: Window = getWindow()
        window.setStatusBarColor(0x00000000)
    }
}

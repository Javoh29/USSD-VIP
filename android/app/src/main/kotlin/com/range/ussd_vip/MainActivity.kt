package com.range.ussd_vip

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        requestPermission()
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.range.tutto/callIntent").setMethodCallHandler { call: MethodCall, _: MethodChannel.Result? ->
            if (call.method == "callIntent") {
                val code = call.argument<String>("code")
                val intent: Intent
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    if (isCallPermissionGranted()) {
                        intent = Intent(Intent.ACTION_CALL)
                        intent.data = Uri.parse("tel:" + code!!.replace("#", Uri.encode("#")))
                        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                        intent.putExtra("com.android.phone.extra.slot", true)
                        intent.putExtra("com.android.phone.extra.slot", true)
                        startActivity(intent)
                    } else {
                        requestPermission()
                    }
                } else {
                    intent = Intent(Intent.ACTION_CALL)
                    intent.data = Uri.parse("tel:" + code!!.replace("#", Uri.encode("#")))
                    intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                    startActivity(intent)
                }
            }
        }
    }

    private fun requestPermission() {
        ActivityCompat.requestPermissions(
                this, arrayOf(
                Manifest.permission.CALL_PHONE,
                Manifest.permission.READ_PHONE_STATE
        ),
                1
        )
    }

    private fun isCallPermissionGranted(): Boolean {
        val request = "android.permission.CALL_PHONE"
        val result = checkCallingOrSelfPermission(request)
        return result == PackageManager.PERMISSION_GRANTED
    }
    
}
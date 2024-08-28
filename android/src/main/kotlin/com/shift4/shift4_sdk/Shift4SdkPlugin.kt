package com.shift4.shift4_sdk

import android.app.Activity
import android.content.Context
import com.venuenext.vnwebsdk.VNNavigationController
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.venuenext.vnwebsdk.VenueNextWeb
import com.venuenext.vnwebsdk.models.User
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding


/** Shift4SdkPlugin */
class Shift4SdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity: Activity? = null;

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "shift4_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null;
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivity() {
    activity = null;
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "initialize") {
      val org = call.argument<String>("org")
      if (org == null) {
        result.success(false)
        return;
      }

      var instance = ""
      if (call.argument<String>("instance") != null) {
        instance = call.argument<String>("instance").toString()
      }
      var env = ""
      if (call.argument<String>("env") != null) {
        env = call.argument<String>("env").toString()
      }

      VenueNextWeb.initialize(org, instance, env)

      result.success(true)
    } else if (call.method == "setUser") {
      var userId = call.argument<String>("userId")
      var email = call.argument<String>("email")
      var firstName = call.argument<String>("firstName")
      var lastName = call.argument<String>("lastName")
      var phoneNumber = call.argument<String>("phoneNumber")
      var provider = call.argument<String>("provider")
      var accessToken = call.argument<String>("accessToken")

      VenueNextWeb.setUser(
        User(
          id = userId,
          email = email,
          firstName = firstName,
          lastName = lastName,
          phoneNumber = phoneNumber,
          provider = provider,
          accessToken = accessToken
        )
      )
      result.success(true)
    } else if (call.method == "logUserOut") {
      VenueNextWeb.logUserOut()
      result.success(true)
    } else if (call.method == "openWallet") {
      if (this.activity == null) {
        result.success(false)
        return;
      }

      VNNavigationController.showWallet(this.activity!!);
      result.success(true)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

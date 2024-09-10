import 'package:shift4_sdk/shift4_sdk_method_channel.dart';

import 'shift4_sdk_platform_interface.dart';

class Shift4Sdk {
  Future<bool?> initialize(String org, {String? instance, String? env}) {
    return Shift4SdkPlatform.instance
        .initialize(org, instance: instance, env: env);
  }

  Future<bool?> setUser(Shift4User user) {
    return Shift4SdkPlatform.instance.setUser(user);
  }

  Future<bool?> setPrivateKey(String? key) {
    return Shift4SdkPlatform.instance.setPrivateKey(key);
  }

  Future<bool?> logUserOut() {
    return Shift4SdkPlatform.instance.logUserOut();
  }

  Future<bool?> isLoggedIn() {
    return Shift4SdkPlatform.instance.isLoggedIn();
  }

  Future<bool?> openWallet() {
    return Shift4SdkPlatform.instance.openWallet();
  }

  Future<bool?> openQRCode() {
    return Shift4SdkPlatform.instance.openQRCode();
  }
}

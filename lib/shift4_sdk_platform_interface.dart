import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'shift4_sdk_method_channel.dart';

abstract class Shift4SdkPlatform extends PlatformInterface {
  /// Constructs a Shift4SdkPlatform.
  Shift4SdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static Shift4SdkPlatform _instance = MethodChannelShift4Sdk();

  /// The default instance of [Shift4SdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelShift4Sdk].
  static Shift4SdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Shift4SdkPlatform] when
  /// they register themselves.
  static set instance(Shift4SdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> initialize(String org, {String? instance, String? env}) {
    throw UnimplementedError(
        'initialize(org, instance, env) has not been implemented.');
  }

  Future<bool?> setUser(Shift4User user) {
    throw UnimplementedError('setUser() has not been implemented.');
  }

  Future<bool?> logUserOut() {
    throw UnimplementedError('logUserOut() has not been implemented.');
  }

  Future<bool?> openWallet() {
    throw UnimplementedError('openWallet() has not been implemented.');
  }
}

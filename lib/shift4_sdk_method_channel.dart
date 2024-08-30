import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'shift4_sdk_platform_interface.dart';

class Shift4User {
  final String? userId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? provider;
  final String? accessToken;

  Shift4User(
      {this.userId,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.provider,
      this.accessToken});
}

/// An implementation of [Shift4SdkPlatform] that uses method channels.
class MethodChannelShift4Sdk extends Shift4SdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('shift4_sdk');

  @override
  Future<bool?> initialize(String org, {String? instance, String? env}) async {
    final result = await methodChannel.invokeMethod<bool>(
        'initialize', {"org": org, "instance": instance, "env": env});
    return result;
  }

  @override
  Future<bool?> setUser(Shift4User user) async {
    final result = await methodChannel.invokeMethod<bool>('setUser', {
      "userId": user.userId,
      "email": user.email,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "phoneNumber": user.phoneNumber,
      "provider": user.provider,
      "accessToken": user.accessToken
    });
    return result;
  }

  @override
  Future<bool?> setPrivateKey(String? key) async {
    final result =
        await methodChannel.invokeMethod<bool>('setPrivateKey', {"key": key});
    return result;
  }

  @override
  Future<bool?> logUserOut() async {
    final result = await methodChannel.invokeMethod<bool>('logUserOut');
    return result;
  }

  @override
  Future<bool?> openWallet() async {
    final result = await methodChannel.invokeMethod<bool>('openWallet');
    return result;
  }
}

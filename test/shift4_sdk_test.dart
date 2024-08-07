import 'package:flutter_test/flutter_test.dart';
import 'package:shift4_sdk/shift4_sdk.dart';
import 'package:shift4_sdk/shift4_sdk_platform_interface.dart';
import 'package:shift4_sdk/shift4_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShift4SdkPlatform
    with MockPlatformInterfaceMixin
    implements Shift4SdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Shift4SdkPlatform initialPlatform = Shift4SdkPlatform.instance;

  test('$MethodChannelShift4Sdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShift4Sdk>());
  });

  test('getPlatformVersion', () async {
    Shift4Sdk shift4SdkPlugin = Shift4Sdk();
    MockShift4SdkPlatform fakePlatform = MockShift4SdkPlatform();
    Shift4SdkPlatform.instance = fakePlatform;

    expect(await shift4SdkPlugin.getPlatformVersion(), '42');
  });
}

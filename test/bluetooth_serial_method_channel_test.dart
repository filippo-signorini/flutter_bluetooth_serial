import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bluetooth_serial/bluetooth_serial_method_channel.dart';

void main() {
  MethodChannelBluetoothSerial platform = MethodChannelBluetoothSerial();
  const MethodChannel channel = MethodChannel('bluetooth_serial');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

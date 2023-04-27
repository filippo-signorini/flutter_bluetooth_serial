import 'package:flutter_test/flutter_test.dart';
import 'package:bluetooth_serial/bluetooth_serial.dart';
import 'package:bluetooth_serial/bluetooth_serial_platform_interface.dart';
import 'package:bluetooth_serial/bluetooth_serial_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBluetoothSerialPlatform
    with MockPlatformInterfaceMixin
    implements BluetoothSerialPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BluetoothSerialPlatform initialPlatform = BluetoothSerialPlatform.instance;

  test('$MethodChannelBluetoothSerial is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBluetoothSerial>());
  });

  test('getPlatformVersion', () async {
    BluetoothSerial bluetoothSerialPlugin = BluetoothSerial();
    MockBluetoothSerialPlatform fakePlatform = MockBluetoothSerialPlatform();
    BluetoothSerialPlatform.instance = fakePlatform;

    expect(await bluetoothSerialPlugin.getPlatformVersion(), '42');
  });
}

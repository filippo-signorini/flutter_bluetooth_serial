
import 'bluetooth_serial_platform_interface.dart';

class BluetoothSerial {
  Future<String?> getPlatformVersion() {
    return BluetoothSerialPlatform.instance.getPlatformVersion();
  }
}
